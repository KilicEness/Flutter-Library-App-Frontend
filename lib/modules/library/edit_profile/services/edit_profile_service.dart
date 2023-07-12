import '/shared/models/user.dart';

import '/shared/helpers/networking.dart';

import './i_edit_profile_service.dart';

class EditProfileService implements IEditProfileService {
  INetwork network;

  EditProfileService({required this.network});

  @override
  Future<UserModel> fetchProfile(
      {required String userId}) async {
    try {
      var response = await network.get('/users/$userId');
      var result = UserModel.fromResponse(response.data);
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<UserModel> editProfile(
      {String? name, String? password, DateTime? birthDay}) async {
    try {
      var response = await network.patch('/users', data: {
        'name': name,
        'password': password,
        'birthDay': birthDay?.toIso8601String(),
      });
      var result = UserModel.fromResponse(response.data);
      return result;
    } catch (e) {
      throw e.toString();
    }
  }
}
