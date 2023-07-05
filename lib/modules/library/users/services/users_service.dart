import 'package:library_app/shared/models/user.dart';
import 'package:library_app/modules/library/users/services/i_users_service.dart';
import 'package:library_app/shared/helpers/networking.dart';

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
