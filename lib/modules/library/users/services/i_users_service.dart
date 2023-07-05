import 'package:library_app/shared/models/user.dart';

abstract class IUsersService {
  Future<List<UserModel>> fetchUsers();
}
