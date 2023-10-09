import 'dart:convert';

import 'package:egtspt/models/session_result_gymer_model.dart';
import 'package:egtspt/router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class SessionResultGymerAPI {
  Future<PTCreateSessionResultModel> createSessionResultGymer(
    context,
    sessionId,
    caloConsump,
    note,
  ) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/SessionResults/CreateSessionResult"),
        body: jsonEncode(
            {'sessionId': sessionId, 'caloConsump': caloConsump, 'note': note}),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      final parsed = PTCreateSessionResultModel.fromJson(
          jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
