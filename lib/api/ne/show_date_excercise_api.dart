import 'dart:convert';

import 'package:egtspt/common_data.dart';
import 'package:egtspt/models/ne/show_date_excercise_schedule_model.dart';
import 'package:egtspt/router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../models/ne/show_ne_schedule_gymer_model.dart';

class ShowNEExcerciseScheduleAPI {
  Future<ExcerciseScheduleNE> fetchExcerciseSchedule() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String userID = await CommonData().getGymerAcceptID();

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/ExcerciseSchedules/GetExcerciseScheduleBygymerID/$userID"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        final parsed =
            ExcerciseScheduleNE.fromJson(jsonDecode(response.body.toString()));
        return parsed;
      }

      return ExcerciseScheduleNE();
    } catch (e) {
      rethrow;
    }
  }

  Future<ShowNEScheduleGymerModel> fetchScheduleGymerByDate(String date) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String gymerID = await CommonData().getGymerAcceptID();

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/ExcerciseSchedules/GetExcerciseScheduleByGymerIDAndDate/$gymerID?date=$date"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      final parsed = ShowNEScheduleGymerModel.fromJson(
          jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
