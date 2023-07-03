part of 'app_navigation_bloc.dart';

abstract class AppNavigationEvent extends Equatable {
  const AppNavigationEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ChangePath extends AppNavigationEvent {
  String path;
  ChangePath({required this.path});
}
