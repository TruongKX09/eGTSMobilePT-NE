import '../api/profile_api.dart';
import '../models/profile_model.dart';

class ProfileHandler {
  Future<Profile> onFetchProfile() async {
    Profile profileuser = await ProfileAPI().fetchProfile();

    return profileuser;
  }
}
