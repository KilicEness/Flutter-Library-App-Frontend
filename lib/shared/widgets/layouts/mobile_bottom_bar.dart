import 'package:library_app/app/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:library_app/shared/helpers/modular_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../constants/app_colors.dart';

class MobileBottomBar extends StatelessWidget {
  MobileBottomBar({Key? key}) : super(key: key);
  final AppNavigationBloc _appNavigationBloc = Modular.get<AppNavigationBloc>();
  final Color selectedColor = const Color.fromRGBO(231, 54, 115, 1);
  int _getIndex(path) {
    switch (path) {
      case '/library/dashboard':
        return 0;
      case '/library/itemSearch':
        return 1;
      case '/library/settings':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      bloc: _appNavigationBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child: SizedBox(
            height: 55,
            child: BottomNavigationBar(
              onTap: (value) => {
                if (value == 0)
                  {ModularNavigator.toReplace('/library/dashboard')}
                else if (value == 1)
                  {ModularNavigator.toReplace('/library/itemSearch')}
                else if (value == 2)
                  {ModularNavigator.toReplace('/library/settings')}
              },
              backgroundColor: AppColors.sideColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard,
                  ),
                  label: 'Menü',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Arama',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: 'Ayarlar')
              ],
              currentIndex: _getIndex(state.activePath),
              // currentIndex: _selectedIndex,
              selectedItemColor: AppColors.sideActiveColor,
              //const Color.fromRGBO(228, 49, 112, 1),
              unselectedItemColor: AppColors.sidePassiveColor,
              // onTap: _onItemTapped,
              selectedLabelStyle: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 14,
                  color: selectedColor),
              unselectedLabelStyle:
                  const TextStyle(fontFamily: 'VarelaRound', fontSize: 14),
            ),
          ),
        );
      },
    );
  }
}
