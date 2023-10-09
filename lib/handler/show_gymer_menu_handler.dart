import '../api/show_gymer_menu_api.dart';
import '../models/show_gymer_menu_model.dart';

class MenuGymerHandler {
  Future<MenuGymerModel> onFetMenuGymer(String dateTime, int mealTime) async {
    dateTime = dateTime.substring(0, 10);
    MenuGymerModel advMenuGymer =
        await MenuGymerAPI().fetchMenuGymerByDate(dateTime, mealTime);
    if (200 == advMenuGymer.code) {
      return advMenuGymer;
    }
    return MenuGymerModel();
  }
}
