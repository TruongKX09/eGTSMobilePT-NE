import 'package:egtspt/api/v2_general_schedule_gymer_api.dart';
import 'package:egtspt/models/v2_showgeneralschedule_gymer_model.dart';

class V2GeneralScheduleHandler {
  Future<V2ShowGeneralScheduleGymerModel> v2GeneralScheduleHandler(
      packageGymerId, dateTime) async {
    dateTime = dateTime.substring(0, 10);
    V2ShowGeneralScheduleGymerModel v2GeneralScheduleV2 =
        await V2GeneralScheduleAPI()
            .getV2ShowGeneralScheduleGymerAPI(packageGymerId, dateTime);
    print(v2GeneralScheduleV2.code);
    if (200 == v2GeneralScheduleV2.code) {
      return v2GeneralScheduleV2;
    }
    return V2ShowGeneralScheduleGymerModel();
  }
}
