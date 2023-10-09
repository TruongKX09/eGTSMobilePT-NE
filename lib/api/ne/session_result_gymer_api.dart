import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../models/ne/session_result_gymer_model.dart';
import '../../router.dart';

class SessionResultAPI {
  Future<NESessionResultModel> fetSessionResult(sessionId) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/SessionResults/GetSessionResultBySessionID/$sessionId"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed =
          NESessionResultModel.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
