import 'package:library_app/app/bloc/authentication/authentication_bloc.dart';
import 'package:library_app/shared/constants/app_colors.dart';
import 'package:library_app/shared/helpers/app_env.dart';
import 'package:library_app/shared/helpers/app_exit.dart';

import 'package:library_app/shared/helpers/modular_navigator.dart';
import 'package:library_app/shared/helpers/screen_size.dart';
import 'package:library_app/shared/widgets/buttons/custom_elevated_button.dart';
import 'package:library_app/shared/widgets/indicators/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _signInForm = GlobalKey<FormState>();
  String errorMessage = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationBloc _authenticationBloc =
      Modular.get<AuthenticationBloc>();

  void _handleSignInWithEmail(
      {required String email, required String password}) {
    _authenticationBloc.add(SignInWithEmail(email: email, password: password));
  }

  void _submitForm() {
    if (_signInForm.currentState!.validate()) {
      // print("email :${_emailController.text}");
      // print("password :${_passwordController.text}");

      _handleSignInWithEmail(
          email: _emailController.text, password: _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize _screen = ScreenSize(context);
    AppExit _appExit = AppExit(context);
    return WillPopScope(
      onWillPop: _appExit.onWillPop,
      child: BlocListener(
        bloc: _authenticationBloc,
        listener: (BuildContext context, state) {
          if (state is AuthenticationFailure) {
            setState(() {
              errorMessage = state.message;
            });
          }

          if (state is AuthenticationSuccess) {
            ModularNavigator.toReplace('/library/dashboard');
          }
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: _screen.width,
                      height: _screen.height - 32,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width > 768
                            ? (MediaQuery.of(context).size.width / 2) - 24
                            : MediaQuery.of(context).size.width - 48,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: SizedBox(
                            width: 348,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/img/library.png",
                                    height: 300,
                                  ),
                                ),
                                const Text(
                                  'Merhaba',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    child: const Text(
                                      'Giriş yapmak için email ve şifrenizi girin',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 5, bottom: 10),
                                    child: Text(
                                      errorMessage,
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100),
                                    )),
                                Form(
                                    key: _signInForm,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          onFieldSubmitted: (v) {
                                            _submitForm();
                                          },
                                          controller: _emailController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Lütfen e-mail adresinizi giriniz';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                "E-posta adresinizi giriniz",
                                            //fillColor: const Color.fromRGBO(231, 54, 115, 1),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              borderSide: const BorderSide(),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              borderSide: BorderSide(
                                                  color:
                                                      AppColors.inputColor),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        TextFormField(
                                          obscureText: true,
                                          onFieldSubmitted: (v) {
                                            _submitForm();
                                          },
                                          controller: _passwordController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Lütfen şifrenizi giriniz';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Şifrenizi giriniz",
                                            //fillColor: const Color.fromRGBO(231, 54, 115, 1),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              borderSide: const BorderSide(),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              borderSide: BorderSide(
                                                  color:
                                                      AppColors.inputColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                BlocBuilder(
                                  bloc: _authenticationBloc,
                                  builder: (BuildContext context, state) {
                                    if (state is AuthenticationLoading) {
                                      return CustomElevatedButton(
                                        height: 50,
                                        label: "Giriş Yapılıyor..",
                                      );
                                    } else {
                                      return CustomElevatedButton(
                                        height: 50,
                                        label: "Giriş Yap",
                                        onClick: _submitForm,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
