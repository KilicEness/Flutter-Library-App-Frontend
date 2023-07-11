import 'package:library_app/app/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:library_app/shared/helpers/screen_size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../constants/app_colors.dart';

// ignore: must_be_immutable
class DesktopAppBar extends StatefulWidget {
  String title;
  Widget user;
  DesktopAppBar({Key? key, required this.title, required this.user})
      : super(key: key);

  @override
  State<DesktopAppBar> createState() => _DesktopAppBarState();
}

class _DesktopAppBarState extends State<DesktopAppBar> {
  final AppNavigationBloc _appNavigationBloc = Modular.get<AppNavigationBloc>();
  String moduleName = "";
  String activeModule = "";
  @override
  void initState() {
    switch (_appNavigationBloc.state.activePath.split("/")[1]) {
      case "library":
        setState(() {
          moduleName = "Library";
          activeModule = "library";
        });
        break;
      default:
        setState(() {
          moduleName = "Library";
          activeModule = "library";
        });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize _screen = ScreenSize(context);
    return AppBar(
      backgroundColor: Colors.brown.shade800,
      elevation: 0.0,
      titleSpacing: 20,
      centerTitle: false,
      automaticallyImplyLeading: false,
      //automaticallyImplyLeading: false,
      leadingWidth: !_screen.isMobile ? 500 : 60,

      title: Row(
        children: [
          SizedBox(
            width: 200,
            child: SelectableText('Kilic Library',
                style: TextStyle(
                    color: AppColors.headerIconColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0)),
          ),
        ],
      ),
      actions: [
        widget.user,
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
