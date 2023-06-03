import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendFullPromptCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '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',
    dynamic? promptJson,
  }) {
    final prompt = _serializeJson(promptJson);
    final body = '''
{
  "model": "gpt-3.5-turbo",
  "messages": ${prompt}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic createdTimestamp(dynamic response) => getJsonField(
        response,
        r'''$.created''',
      );
  static dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.role''',
      );
  static dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
}

class VoiceChatCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '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',
    String? message = '',
  }) {
    final body = '''
{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "user",
      "content": "${message}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Voice Chat',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
