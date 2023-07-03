import 'package:library_app/modules/library/users/models/user.dart';

abstract class IUsersService {
  Future<List<UserModel>> fetchUsers();
}
