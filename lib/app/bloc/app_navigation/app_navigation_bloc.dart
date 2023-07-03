import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_navigation_event.dart';
part 'app_navigation_state.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  AppNavigationBloc()
      : super(const AppNavigationState(activePath: "/", oldPath: "/")) {
    on<ChangePath>(_onChangePath);
  }

  void _onChangePath(ChangePath event, emit) {
    var state = this.state;
    emit(AppNavigationState(activePath: event.path, oldPath: state.activePath));    
  }
}
