import 'package:library_app/app/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:library_app/shared/helpers/modular_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../constants/app_colors.dart';

// ignore: must_be_immutable
class MobileAppBar extends StatefulWidget {
  String title;
  Widget user;

  MobileAppBar({Key? key, required this.title, required this.user})
      : super(key: key);

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();
}

class _MobileAppBarState extends State<MobileAppBar> {
  String? backPath;
  final AppNavigationBloc _appNavigationBloc = Modular.get<AppNavigationBloc>();
  String moduleName = "";
  String activeModule = "";
  @override
  void initState() {
    switch (_appNavigationBloc.state.activePath.split("/")[1]) {
      case "library":
        setState(() {
          moduleName = "Mağaza";
          activeModule = "library";
        });
        break;
      case "order":
        setState(() {
          moduleName = "Sipariş";
          activeModule = "order";
        });
        break;
      default:
        setState(() {
          moduleName = "Mağaza";
          activeModule = "library";
        });
    }
    super.initState();
  }

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .38,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SelectableText(
                "  ${widget.title == "Menü" ? moduleName : widget.title}",
                style: TextStyle(
                    color: AppColors.headerIconColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 15),
              ),
            ),
          ),
          if (widget.title == "Menü")
            (Row(
              children: [
                IconButton(
                    onPressed: () {
                      ModularNavigator.toPush('/library/dashboard');
                    },
                    icon: Icon(
                      Icons.storefront_outlined,
                      color: activeModule == "library"
                          ? AppColors.successBgColor
                          : AppColors.headerIconColor,
                      size: 18,
                    )),
                IconButton(
                    onPressed: () {
                      ModularNavigator.toPush('/order/dashboard');
                    },
                    icon: Icon(
                      Icons.language,
                      color: activeModule == "order"
                          ? AppColors.successBgColor
                          : AppColors.headerIconColor,
                      size: 18,
                    )),
              ],
            ))
        ],
      ),
      backgroundColor: AppColors.headerColor,
      elevation: 0.0,
      titleSpacing: 0,
      centerTitle: false,
      automaticallyImplyLeading: widget.title == 'Menü' ? false : true,
      foregroundColor: AppColors.headerIconColor,

      // leading: title != "Menu"
      //     ? IconButton(
      //         onPressed: () {
      //           if (backPath != null) {
      //             ModularNavigator.toPopAndPush(backPath);
      //           } else {
      //             ModularNavigator.toPop();
      //           }
      //         },
      //         icon: const Icon(Icons.arrow_back))
      //     : null,

      // automaticallyImplyLeading: false,

      actions: [
        widget.user,
        IconButton(
            onPressed: () {
              ModularNavigator.toPush('/logout');
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ))
      ],
    );
  }
}
