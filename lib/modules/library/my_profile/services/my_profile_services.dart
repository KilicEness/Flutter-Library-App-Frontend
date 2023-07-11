import '/shared/models/user.dart';

import './i_my_profile_service.dart';
import '/shared/helpers/networking.dart';

class MyProfileService implements IMyProfileService {
  INetwork network;

  MyProfileService({required this.network});

  @override
  Future<UserModel> fetchUser({required String userId}) async {
    try {
      var response = await network.get('/users/$userId');
      var model = UserModel.fromResponse(response.data);

      return model;
    } catch (e) {
      throw e.toString();
    }
  }
}