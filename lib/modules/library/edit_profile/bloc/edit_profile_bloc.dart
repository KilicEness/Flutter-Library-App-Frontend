import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_app/shared/helpers/local_storage.dart';

import '/shared/models/user.dart';
import '../services/i_edit_profile_service.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  IEditProfileService iEditProfileService;
  EditProfileBloc({required this.iEditProfileService})
      : super(EditProfileInitial()) {
    on<EditProfileEvent>(_onEditProfile);
    on<UserProfileFetch>(_onProfileFetch);
  }

  void _onProfileFetch(event, emit) async {
      emit(EditProfileLoading());
      try {
        ILocalStorage localStorage = SPStorage();
        var userId = await localStorage.getData('userId');

        final user = await iEditProfileService.fetchProfile(
          userId: userId
        );
        emit(EditProfileSuccess(user: user));
      } catch (e) {
        emit(EditProfileFailure(message: e.toString()));
      }
  }

  void _onEditProfile(event, emit) async {
    if (event is EditProfileUpdate) {
      emit(EditProfileLoading());
      try {
        final updatedUser = await iEditProfileService.editProfile(
          name: event.name,
          password: event.password,
          birthDay: event.birthDay,
        );
        emit(EditProfileSuccess(user: updatedUser));
      } catch (e) {
        emit(EditProfileFailure(message: e.toString()));
      }
    }
  }
}
