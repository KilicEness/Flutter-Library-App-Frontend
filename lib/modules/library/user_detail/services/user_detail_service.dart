import './/shared/models/user.dart';
import './/shared/helpers/networking.dart';

import '../services/i_user_detail_service.dart';

class UserDetailService implements IUserDetailService {
  INetwork network;

  UserDetailService({required this.network});

  @override
  Future<UserModel> fetchUserDetail({required String userId}) async {
    try {
      var response = await network.get('/users/$userId');
      var model = UserModel.fromResponse(response.data);

      return model;
    } catch (e) {
      throw e.toString();
    }
  }
}
