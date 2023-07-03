import 'package:library_app/shared/widgets/layouts/desktop_breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

//Auth Bloc
import 'package:library_app/app/bloc/authentication/authentication_bloc.dart';
import '../../constants/app_colors.dart';
import '../../helpers/modular_navigator.dart';
import '../../helpers/screen_size.dart';
import './mobile_app_bar.dart';
import './mobile_bottom_bar.dart';
import './desktop_sidebar.dart';
import './desktop_app_bar.dart';

// ignore: must_be_immutable
class LibraryScaffold extends StatefulWidget {
  Widget? body;
  String? title;
  bool bottomBarShow = false;
  LibraryScaffold({Key? key, this.body, this.title}) : super(key: key) {
    if (title == "Menü" || title == "Arama Yap" || title == "Ayarlar") {
      bottomBarShow = true;
    }
  }

  @override
  State<LibraryScaffold> createState() => _LibraryScaffoldState();
}

class _LibraryScaffoldState extends State<LibraryScaffold> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final AuthenticationBloc _authenticationBloc =
      Modular.get<AuthenticationBloc>();

  Widget _userPopup(Widget child) => PopupMenuButton<int>(
        //icon: const Icon(Icons.person),
        child: child,
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: const Text("Hesap Ayarları"),
            onTap: () {
              ModularNavigator.toPush('/library/userSettings');
            },
          ),
          PopupMenuItem(
            value: 2,
            child: const Text("Çıkış"),
            onTap: () {
              ModularNavigator.toPush('/logout');
            },
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    ScreenSize _screen = ScreenSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _screen.isMobile
          ? PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: MobileAppBar(
                title: widget.title ?? "",
                user: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    bloc: _authenticationBloc,
                    builder: (context, state) {
                      if (state is AuthenticationSuccess) {
                        return TextButton.icon(
                            onPressed: () {
                              ModularNavigator.toPush('/library/userSettings');
                            },
                            icon: Icon(
                              Icons.person,
                              color: AppColors.headerIconColor,
                            ),
                            label: Text(
                              "",
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold),
                            ));
                      } else {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 15),
                          height: 0,
                          width: 30,
                          child: const CircularProgressIndicator(
                            color: Color.fromRGBO(231, 54, 115, 1),
                          ),
                        );
                      }
                    }),
              ))
          : null,
      extendBody: true,
      key: _key,
      bottomNavigationBar:
          _screen.isMobile && widget.bottomBarShow ? MobileBottomBar() : null,
      body: Container(
        color: AppColors.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!_screen.isMobile)
              DesktopAppBar(
                title: widget.title ?? "",
                user: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    bloc: _authenticationBloc,
                    builder: (context, state) {
                      if (state is AuthenticationSuccess) {
                        return _userPopup(Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(top: 12, bottom: 12),
                          decoration: BoxDecoration(
                              color: AppColors.headerBadgeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: AppColors.headerIconColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                state.user.email ?? "",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.headerIconColor,
                                    fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                        ));
                        //return _userPopup();
                      } else {
                        return Container(
                          padding: const EdgeInsets.all(5),
                          height: 20,
                          width: 40,
                          child: const CircularProgressIndicator(
                            color: Color.fromRGBO(231, 54, 115, 1),
                          ),
                        );
                      }
                    }),
              ),
            SizedBox(
              width: _screen.width,
              height: _screen.height - 85,
              child: Row(
                children: [
                  if (!_screen.isMobile) (const DesktopSidebar()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!_screen.isMobile)
                        (DesktopBreadcrump(
                          title: widget.title.toString(),
                        )),
                      Flexible(
                        child: Container(
                          //padding: const EdgeInsets.only(top: 12),
                          width: !_screen.isMobile
                              ? _screen.width - 237
                              : _screen.width - 20,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          height: _screen.height,
                          child: widget.body,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
