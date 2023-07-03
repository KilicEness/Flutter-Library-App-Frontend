import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

//App Bloc
import 'package:library_app/app/bloc/app_navigation/app_navigation_bloc.dart';

import '../../constants/nav_links.dart';
import '../../helpers/modular_navigator.dart';
import '../../constants/app_colors.dart';

class DesktopSidebar extends StatefulWidget {
  const DesktopSidebar({Key? key}) : super(key: key);

  @override
  State<DesktopSidebar> createState() => _DesktopSidebarState();
}

class _DesktopSidebarState extends State<DesktopSidebar> {
  List<NavItem> _navItems = [];
  final AppNavigationBloc _appNavigationBloc = Modular.get<AppNavigationBloc>();

  @override
  void initState() {
    switch (_appNavigationBloc.state.activePath.split("/")[1]) {
      case "library":
        setState(() {
          _navItems = libraryNavLinks;
        });
        break;
      default:
        setState(() {
          _navItems = libraryNavLinks;
        });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 217,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColors.sideColor,
      ),
      child: BlocBuilder<AppNavigationBloc, AppNavigationState>(
        bloc: _appNavigationBloc,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ..._navItems.map((element) {
                  bool isSelected =
                      element.pathGroup == state.activePath ? true : false;
                  return SidebarItem(navItem: element, isSelected: isSelected);
                })
              ],
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class SidebarItem extends StatelessWidget {
  NavItem navItem;
  bool isSelected;
  SidebarItem({Key? key, required this.navItem, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.sideActiveBgColor,
              border: Border(
                  left: BorderSide(
                      color: AppColors.sideLeftBorderColor, width: 2)))
          : null,
      //margin: const EdgeInsets.only(top: 3, bottom: 3),
      width: 215,
      child: ListTile(
        leading: Icon(
          navItem.icon,
          color: isSelected
              ? AppColors.sideActiveColor
              : AppColors.sidePassiveColor,
          size: 18,
        ),
        title: Text(
          navItem.label,
          style: TextStyle(
              color: isSelected
                  ? AppColors.sideActiveColor
                  : AppColors.sidePassiveColor,
              fontWeight: FontWeight.w100,
              fontSize: 13),
        ),
        onTap: () {
          ModularNavigator.toPush(navItem.path);
        },
      ),
    );
  }
}
