const axios = require("axios").default;
const qs = require("qs");

/// Start Send email Group Code

function createSendEmailGroup() {
  return {
    baseUrl: `https://api.brevo.com/`,
    headers: {
      "api-key": ``,
    },
  };
}

async function _sendEmailCall(context, ffVariables) {
  var email = ffVariables["email"];
  var name = ffVariables["name"];
  var text = ffVariables["text"];
  const sendEmailGroup = createSendEmailGroup();

  var url = `${sendEmailGroup.baseUrl}/v3/smtp/email`;
  var headers = {
    "api-key": ``,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "sender": {
    "name": "Reksoft portal",
    "email": "oper2k@gmail.com"
  },
  "to": [
    {
      "email": "${email}",
      "name": "${name}"
    }
  ],
  "htmlContent": "<!DOCTYPE html> <html> <body> <h3>${text}</h3> </html>",
  "subject": "Уведомление"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

/// End Send email Group Code

/// Start OpenAI ChatGPT Group Code

function createOpenAIChatGPTGroup() {
  return {
    baseUrl: `https://api.openai.com/v1`,
    headers: { "Content-Type": `application/json` },
  };
}

async function _sendFullPromptCall(context, ffVariables) {
  var prompt = ffVariables["prompt"];
  const openAIChatGPTGroup = createOpenAIChatGPTGroup();

  var url = `${openAIChatGPTGroup.baseUrl}/chat/completions`;
  var headers = {
    "Content-Type": `application/json`,
    Authorization: `Bearer `,
  };
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-3.5-turbo",
  "messages": ${prompt}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({
      headers,
      params,
      body: ffApiRequestBody,
      bodyType: "JSON",
    }),
    returnBody: true,
  });
}

/// End OpenAI ChatGPT Group Code

/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    SendEmailCall: _sendEmailCall,
    SendFullPromptCall: _sendFullPromptCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
