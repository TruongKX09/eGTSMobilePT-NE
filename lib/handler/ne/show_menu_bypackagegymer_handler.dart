import 'package:egtspt/api/ne/show_menu_bypackagegymer_api.dart';
import 'package:egtspt/models/ne/showmenu_bypackagegymer_model.dart';

class ShowMenuByPackageGymerHandler {
  Future<ShowMenuByPackageGymerModel> onFetMenuGymer(
      String packageGymerID, String dateTime, int mealTime) async {
    dateTime = dateTime.substring(0, 10);
    ShowMenuByPackageGymerModel showMenuGymerByPkGymerID =
        await ShowMenuByPkGymerAPI()
            .fetchShowMenuByPkGymerAPI(packageGymerID, dateTime, mealTime);
    if (200 == showMenuGymerByPkGymerID.code) {
      return showMenuGymerByPkGymerID;
    }
    return ShowMenuByPackageGymerModel();
  }
}
