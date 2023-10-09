import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/create_body_parameter_model.dart';
import '../router.dart';

class CreateBodyParameterAPI {
  Future<BodyParameter> createBodyParameter(
      context, gymerID, goal, wei, hei, bone, fat, muscle) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/BodyPerameters/CreateBodyPerameter"),
        body: jsonEncode({
          'gymerId': gymerID,
          'goal': goal,
          'weight': int.parse(wei),
          'height': int.parse(hei),
          'bone': int.parse(bone),
          'fat': int.parse(fat),
          'muscle': int.parse(muscle),
        }),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
      );
      print(response.toString());

      final parsed =
          BodyParameter.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
