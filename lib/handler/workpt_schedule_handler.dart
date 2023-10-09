import 'package:egtspt/api/workpt_schedule_api.dart';
import 'package:egtspt/models/workpt_schedule_model.dart';

class WorkPTScheduelHandler {
  Future<WorkPtSchedule> onFetWorkPTSchedule(String dateTime) async {
    dateTime = dateTime.substring(0, 10);
    WorkPtSchedule advWorkPTSchedule =
        await WorkPTScheduleAPI().fetchWorkPTByDate(dateTime);
    if (200 == advWorkPTSchedule.code) {
      return advWorkPTSchedule;
    }
    return WorkPtSchedule();
  }
}
