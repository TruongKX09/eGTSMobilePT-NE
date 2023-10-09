import 'dart:convert';

import 'package:egtspt/models/v2_showgeneralschedule_gymer_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

import '../router.dart';

class V2GeneralScheduleAPI {
  Future<V2ShowGeneralScheduleGymerModel> getV2ShowGeneralScheduleGymerAPI(
      packageGymerID, date) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/ExcerciseSchedules/GetExcerciseScheduleByPackageGymerIDAndDate/$packageGymerID?date=$date"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        final parsed = V2ShowGeneralScheduleGymerModel.fromJson(
            jsonDecode(response.body.toString()));

        return parsed;
      } else {
        return V2ShowGeneralScheduleGymerModel();
      }
    } catch (e) {
      rethrow;
    }
  }
}
