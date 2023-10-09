import 'package:egtspt/api/detail_excercise_pt_api.dart';

import 'package:egtspt/models/detail_excercise_pt_model.dart';

class DetailExcercisePTHandler {
  Future<DetailExcerciseModel> onFetchDetailExcercisePT() async {
    DetailExcerciseModel advDetailExcercisePT =
        await DetailExcercisePTAPI().fetchDetailExcercisePT();
    if (200 == advDetailExcercisePT.code) {
      return advDetailExcercisePT;
    }
    return DetailExcerciseModel();
  }
}
