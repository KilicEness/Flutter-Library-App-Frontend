import './/shared/models/user.dart';
import './/shared/helpers/networking.dart';

import './i_users_service.dart';

class UsersService implements IUsersService {
  INetwork network;

  UsersService({required this.network});

  @override
  Future<List<UserModel>> fetchUsers() async {
    try {
      var response = await network.get('/users');
      var model = (response.data as List)
          .map((e) => UserModel.fromResponse(e))
          .toList();

      return model;
    } catch (e) {
      throw e.toString();
    }
  }
}
