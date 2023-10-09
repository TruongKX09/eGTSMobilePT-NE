import 'dart:convert';

import 'package:egtspt/models/update_calendar_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import '../common_data.dart';
import '../router.dart';

class ScheduleAPI {
  // Future<void> callCreateSchedule(List<DataExcercisePt> data, date) async {
  //   String packageGymerID = await CommonData().getPackageGymerID();
  //   String? token = await const FlutterSecureStorage().read(key: 'token');
  //   List<String> str = [];
  //   for (var element in data) {
  //     str.add(element.id!);
  //   }
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse("$sPreApiUrl/Sessions/CreateSessionV2"),
  //       body: jsonEncode({
  //         "packageGymerID": packageGymerID,
  //         "dateAndTime": "${date.toString().substring(0, 10)}T00:00:00",
  //         "listExcerciseID": str.toList()
  //       }),
  //       headers: <String, String>{
  //         'accept': 'text/plain',
  //         'Content-Type': 'application/json',
  //         'token': 'Bearer $token'
  //       },
  //     );
  //     if (response.statusCode == 200) {}
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<CalendarPt> getListDate() async {
    String packageGymerID = await CommonData().getPackageGymerID();
    String? token = await const FlutterSecureStorage().read(key: 'token');
    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/ExcerciseSchedules/GetExcerciseScheduleByPackageGymerID/$packageGymerID"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        final parsed =
            CalendarPt.fromJson(jsonDecode(response.body.toString()));

        return parsed;
      } else {
        return CalendarPt();
      }
    } catch (e) {
      rethrow;
    }
  }
}
