import 'package:library_app/shared/models/user.dart';
import 'package:library_app/modules/library/user_detail/services/i_user_detail_service.dart';
import 'package:library_app/shared/helpers/networking.dart';

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
