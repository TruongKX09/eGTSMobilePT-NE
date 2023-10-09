import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../common_data.dart';
import '../models/create_excercise_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../router.dart';

class CreateExcerciseAPI {
  Future<CreateExcercise> callCreateExcercise(name, description, video,
      calorieCumsumption, repTime, unitOfMeasurement) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String ptid = await CommonData().getUserID();
    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/Excercises/CreateExcercise"),
        body: jsonEncode({
          'ptid': ptid,
          'name': name,
          'description': description,
          'video': video,
          "calorieCumsumption": int.parse(calorieCumsumption),
          "repTime": int.parse(repTime),
          "unitOfMeasurement": unitOfMeasurement,
        }),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed =
          CreateExcercise.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
