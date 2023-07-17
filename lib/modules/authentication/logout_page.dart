import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './/app/bloc/authentication/authentication_bloc.dart';
import './/shared/helpers/modular_navigator.dart';
import './/shared/widgets/indicators/custom_loading_indicator.dart';

class LogOutPage extends StatefulWidget {
  const LogOutPage({Key? key}) : super(key: key);

  @override
  State<LogOutPage> createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  final AuthenticationBloc _authenticationBloc =
      Modular.get<AuthenticationBloc>();

  @override
  void initState() {
    _authenticationBloc.add(SignOut());
    Future.delayed(const Duration(seconds: 1))
        .then((val) => {ModularNavigator.toReplace('/login')});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        CustomLoadingIndicator(),
        SizedBox(
          height: 30,
        ),
        Text(
          'Logout.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Please wait..',
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 17),
        )
      ],
    );
  }
}
