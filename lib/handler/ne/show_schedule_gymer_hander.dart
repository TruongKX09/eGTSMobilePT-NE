import 'package:egtspt/api/ne/show_date_excercise_api.dart';

import '../../models/ne/show_date_excercise_schedule_model.dart';
import '../../models/ne/show_ne_schedule_gymer_model.dart';

class ShowScheduleGymerHandler {
  //1
  Future<ExcerciseScheduleNE> onFetchExcerciseSchedule() async {
    ExcerciseScheduleNE advExcerciseSchedule =
        await ShowNEExcerciseScheduleAPI().fetchExcerciseSchedule();
    if (200 == advExcerciseSchedule.code) {
      return advExcerciseSchedule;
    }
    return ExcerciseScheduleNE();
  }

  Future<ShowNEScheduleGymerModel> onFetScheduleGymer(String dateTime) async {
    dateTime = dateTime.substring(0, 10);
    ShowNEScheduleGymerModel advSchedulGymer =
        await ShowNEExcerciseScheduleAPI().fetchScheduleGymerByDate(dateTime);
    if (200 == advSchedulGymer.code) {
      return advSchedulGymer;
    }
    return ShowNEScheduleGymerModel();
  }
}
