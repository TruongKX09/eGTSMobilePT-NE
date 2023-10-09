import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/update_schedule_pt_model.dart';
import '../router.dart';

class UpdateSchedulePTAPI {
  Future<UpdateSchedule> updateSchedule(
      context, sessionID, date, from, to, List<String> listExcercise) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    print(sessionID);
    try {
      http.Response response = await http.put(
        Uri.parse("$sPreApiUrl/Sessions/UpdateSession/$sessionID"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
        body: jsonEncode({
          'dateTime': date,
          "from": from,
          "to": to,
          "listExcercise": listExcercise,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        final parsed =
            UpdateSchedule.fromJson(jsonDecode(response.body.toString()));
        return parsed;
      }
      return UpdateSchedule();
    } catch (e) {
      rethrow;
    }
  }
}
