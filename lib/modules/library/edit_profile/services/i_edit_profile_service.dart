import '/shared/models/user.dart';

abstract class IEditProfileService {
  Future<UserModel> editProfile({
    String? name,
    String? password,
    DateTime? birthDay,
  });

  Future<UserModel> fetchProfile({
    required String userId,
  });
}
