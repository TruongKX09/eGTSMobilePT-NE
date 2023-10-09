import 'dart:convert';

import 'package:egtspt/models/workpt_schedule_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../common_data.dart';

import '../router.dart';

class WorkPTScheduleAPI {
  Future<WorkPtSchedule> fetchWorkPTByDate(String date) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String ptID = await CommonData().getUserID();

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/ExcerciseSchedules/GetWorkingScheduleByPTIDAndDate/$ptID?date=$date"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      final parsed =
          WorkPtSchedule.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
