import 'package:egtspt/api/create_excercise_api.dart';

import '../models/create_excercise_model.dart';

class CreateExcerciseHandler {
  Future<String> cExcersiteBtnClk(
      String name,
      String description,
      String video,
      String calorieCumsumption,
      String repTime,
      String unitOfMeasurement) async {
    CreateExcercise createExcerciseCommit = await CreateExcerciseAPI()
        .callCreateExcercise(name, description, video, calorieCumsumption,
            repTime, unitOfMeasurement);
    if (200 == createExcerciseCommit.code) {
      return createExcerciseCommit.message!;
    } else {
      return createExcerciseCommit.message ?? "Không thành công";
    }
  }
}
