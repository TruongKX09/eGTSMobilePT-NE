import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../../common_data.dart';

import '../../models/ne/list_accept_ne_model.dart';

import '../../router.dart';

class GymerAcceptNEAPI {
  Future<ListGymerAcceptNe> fetchGymerAcceptNE() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String sSearchId = await CommonData().getUserID();

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/PackageGymers/GetGymerPackageActiveByNE?NEID=$sSearchId"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      final parsed =
          ListGymerAcceptNe.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
