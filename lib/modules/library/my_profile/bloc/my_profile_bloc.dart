import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_app/shared/helpers/local_storage.dart';
import '../services/i_my_profile_service.dart';
import '../../../../shared/models/user.dart';

part 'my_profile_event.dart';
part 'my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  final IMyProfileService iMyProfileService;
  MyProfileBloc({required this.iMyProfileService}) : super(MyProfileInitial()) {
    on<MyProfileFetch>((event, emit) async {
      try {
        emit(MyProfileLoading());

        ILocalStorage localStorage = SPStorage();
        var userId = await localStorage.getData('userId');

        var result = await iMyProfileService.fetchUser(userId: userId);
        emit(MyProfileSuccess(user: result));
      } catch (e) {
        emit(MyProfileFail(errorMessage: e.toString()));
      }
    });
  }
}
