import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/i_user_detail_service.dart';
import '../../../../shared/models/user.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final IUserDetailService iUserDetailService;
  UserDetailBloc({required this.iUserDetailService})
      : super(UserDetailInitial()) {
    on<UserDetailFetch>((event, emit) async {
      try {
        emit(UserDetailLoading());

        var result = await iUserDetailService.fetchUserDetail(userId: event.userId);
        emit(UserDetailSuccess(userDetail: result));
      } catch (e) {
        emit(UserDetailFail(errorMessage: e.toString()));
      }
    });
  }
}
