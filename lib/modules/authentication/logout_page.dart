import 'package:library_app/app/bloc/authentication/authentication_bloc.dart';
import 'package:library_app/shared/helpers/modular_navigator.dart';
import 'package:library_app/shared/widgets/indicators/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          'Çıkış yapılıyor.',
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
