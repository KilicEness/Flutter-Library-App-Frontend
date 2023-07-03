import 'package:library_app/shared/helpers/local_storage.dart';
import 'package:library_app/shared/helpers/networking.dart';

import './i_authentication_service.dart';
import '../../models/user_model.dart';

class AuthenticationService implements IAuthenticationService {
  INetwork network;
  ILocalStorage localStorage;

  AuthenticationService({required this.network, required this.localStorage});

  @override
  Future<UserModel> getUserData() async {
    //return _loginUser!;

    UserLocalDataModel userLocalDataResponse = await localStorage.getUserData();

    UserModel userData = UserModel(
        userId: userLocalDataResponse.userId,
        email: userLocalDataResponse.email);
    return userData;
  }

  @override
  Future<UserModel> signInWitEmail(
      {required String email, required String password}) async {
    try {
      var response = await network.post('/users/login',
          data: {"email": email, "password": password});
      if (response.statusCode != 200) {
        throw response.data['error'];
      }
      UserLocalDataModel userLocalDataDto =
          UserLocalDataModel.fromResponse(response.data);
      await localStorage.setUserData(userLocalDataDto);

      return UserModel.fromResponse(response.data);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<bool> userLoginStatus() async {
    UserLocalDataModel response = await localStorage.getUserData();
    return response.isLogin;
  }

  @override
  Future<void> userLogout() async {
    await localStorage.removeUserData();
  }
}
