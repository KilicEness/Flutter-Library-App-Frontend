import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/i_users_service.dart';
import '../models/user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  IUsersService iUsersService;
  UsersBloc({required this.iUsersService})
      : super(UsersInitial()) {
    on<UsersFetch>(_fetchUsers);
  }

  void _fetchUsers(
      UsersFetch event, Emitter<UsersState> emit) async {
    try {
      emit(UsersLoading());
      var response = await iUsersService.fetchUsers();
      emit(UsersSuccess(users: response));
    } catch (e) {
      emit(UsersFailure(message: e.toString()));
    }
  }
}
