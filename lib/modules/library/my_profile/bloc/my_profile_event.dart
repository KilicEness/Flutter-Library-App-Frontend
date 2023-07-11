part of 'my_profile_bloc.dart';

abstract class MyProfileEvent extends Equatable {
  const MyProfileEvent();

  @override
  List<Object> get props => [];
}

class MyProfileFetch extends MyProfileEvent {
  const MyProfileFetch();
}
