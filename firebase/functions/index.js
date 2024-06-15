const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const https = require("https");
const cors = require("cors")({ origin: true });
const corsProxyRuntimeOptions = { minInstances: 1, timeoutSeconds: 15 };

/**
 * Provides a CORS proxy and returns the response body of the requested url,
 * which should be encoded with encodeURIComponent if there are additional
 * parameters for the requested url.
 */
exports.corsProxy = functions
  .runWith(corsProxyRuntimeOptions)
  .https.onRequest((req, res) => handleRequest(req, res));

async function handleRequest(req, res) {
  cors(req, res, () => {
    console.log("Body:", req.body);
    let url = req.query.url || req.body.url;
    if (!url) {
      res.status(403).send("URL is empty.");
    }
    https.get(url, (resp) => {
      res.setHeader("content-type", resp.headers["content-type"]);
      resp.pipe(res);
    });
  });
}
const apiManager = require("./api_manager");
exports.ffPrivateApiCall = functions
  .runWith({ minInstances: 1, timeoutSeconds: 120 })
  .https.onCall(async (data, context) => {
    try {
      console.log(`Making API call for ${data["callName"]}`);
      var response = await apiManager.makeApiCall(context, data);
      console.log(`Done making API Call! Status: ${response.statusCode}`);
      return response;
    } catch (err) {
      console.error(`Error performing API call: ${err}`);
      return {
        statusCode: 400,
        error: `${err}`,
      };
    }
  });
exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("users/" + user.uid);
  await firestore.collection("users").doc(user.uid).delete();
});
