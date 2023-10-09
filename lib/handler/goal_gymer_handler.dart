import 'package:egtspt/api/goal_gymer_api.dart';
import 'package:egtspt/models/goal_gymer_model.dart';

class GoalGymerHandler {
  Future<GoalGymer> onFetchGoalGymer() async {
    GoalGymer advGoalGymer = await GoalGymerAPI().fetchGoalGymer();
    if (200 == advGoalGymer.code) {
      return advGoalGymer;
    }
    return GoalGymer();
  }
}
