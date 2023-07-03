part of 'app_navigation_bloc.dart';

class AppNavigationState extends Equatable {
  final String activePath;
  final String oldPath;
  const AppNavigationState({required this.activePath, required this.oldPath});

  @override
  List<Object> get props => [activePath,oldPath];
}
