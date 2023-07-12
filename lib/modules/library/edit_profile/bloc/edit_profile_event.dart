part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class UserProfileFetch extends EditProfileEvent {
  const UserProfileFetch();
}

class EditProfileUpdate extends EditProfileEvent {
  final String? name;
  final String? password;
  final DateTime? birthDay;

  const EditProfileUpdate(
      {this.name, this.password, this.birthDay});
}
