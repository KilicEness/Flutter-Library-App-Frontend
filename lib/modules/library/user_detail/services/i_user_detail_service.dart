import 'package:library_app/shared/models/user.dart';

abstract class IUserDetailService {
  Future<UserModel> fetchUserDetail({required String userId});
}
