import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Send email Group Code

class SendEmailGroup {
  static SendEmailCall sendEmailCall = SendEmailCall();
}

class SendEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? name = '',
    String? text = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendEmailCall',
        'variables': {
          'email': email,
          'name': name,
          'text': text,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End Send email Group Code

/// Start OpenAI ChatGPT Group Code

class OpenAIChatGPTGroup {
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    dynamic? promptJson,
  }) async {
    final prompt = _serializeJson(promptJson);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendFullPromptCall',
        'variables': {
          'prompt': prompt,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  int? createdTimestamp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.role''',
      ));
  String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

/// End OpenAI ChatGPT Group Code

class SendFileToGPTCall {
  static Future<ApiCallResponse> call({
    String? fileUrl = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "data": {
    "fileUrl": "${fileUrl}",
    "userId": "${userId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send file to GPT',
      apiUrl:
          'https://us-central1-reksoft-21-46uzyi.cloudfunctions.net/analyzePdfFile',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AnalyseChatCall {
  static Future<ApiCallResponse> call({
    dynamic? jsonDataJson,
    String? responseId = '',
  }) async {
    final jsonData = _serializeJson(jsonDataJson);
    final ffApiRequestBody = '''
{
  "data": {
    "jsonData": ${jsonData},
    "responseId": "${responseId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Analyse Chat',
      apiUrl:
          'https://us-central1-reksoft-21-46uzyi.cloudfunctions.net/analyzeJsonData',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ParseResumePDFFieldsByGPTCall {
  static Future<ApiCallResponse> call({
    String? fileUrl = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "data": {
    "fileUrl": "${fileUrl}",
    "userId": "${userId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Parse Resume PDF Fields by GPT',
      apiUrl:
          'https://us-central1-reksoft-21-46uzyi.cloudfunctions.net/parsePdfFile',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCityPredictionsCall {
  static Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    final ffApiRequestBody = '''
{
        "query": "${query}",
        "count": 3,
        "locations": [
            {
                "country_iso_code": "RU",
                "from_bound": {"value": "city"},
                "to_bound": {"value": "city"}
            }
        ]
    }''';
    return ApiManager.instance.makeApiCall(
      callName: 'getCityPredictions',
      apiUrl:
          'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Token ',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? cities(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions[:].data.city''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GenerateVacancyCall {
  static Future<ApiCallResponse> call({
    String? vacancyDescription = '',
    String? vacancyId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "data": {
    "vacancyDescription":"${vacancyDescription}",
    "vacancyId": "${vacancyId}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateVacancy',
      apiUrl:
          'https://us-central1-reksoft-21-46uzyi.cloudfunctions.net/generateVacancy',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
