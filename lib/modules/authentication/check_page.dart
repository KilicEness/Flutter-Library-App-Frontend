import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '/app/bloc/authentication/authentication_bloc.dart';
import '/shared/widgets/indicators/custom_loading_indicator.dart';

class CheckPage extends StatelessWidget {
  // final AuthenticationBloc _authenticationBloc =
  //     Modular.get<AuthenticationBloc>()..add(AuthenticationStatusCheck());

  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.get<AuthenticationBloc>()
        .add(const AuthenticationStatusCheck(isRedirect: true));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        CustomLoadingIndicator(),
        SizedBox(
          height: 30,
        ),
        Text(
          'Oturum kontrol ediliyor.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Lütfen bekleyiniz..',
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 17),
        )
      ],
    );
  }
}
