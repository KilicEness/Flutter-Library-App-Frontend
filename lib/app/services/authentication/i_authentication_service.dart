import '../../models/user_model.dart';

abstract class IAuthenticationService {
  Future<UserModel> signInWitEmail(
      {required String email, required String password});

  Future<bool> userLoginStatus();

  Future<UserModel> getUserData();

  Future<void> userLogout();
}
