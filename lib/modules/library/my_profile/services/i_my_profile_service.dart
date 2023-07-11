import '/shared/models/user.dart';

abstract class IMyProfileService {
  Future<UserModel> fetchUser({required String userId});
}