import 'package:flutter/material.dart';

//Shared
import 'package:library_app/shared/constants/nav_links.dart';
import 'package:library_app/shared/helpers/screen_size.dart';
import 'package:library_app/shared/widgets/layouts/library_scaffold.dart';
import 'package:library_app/shared/helpers/app_exit.dart';
import 'package:library_app/shared/widgets/layouts/card_container.dart';

import './widgets/dashboard_menu_button.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late ScrollController _scrollController;
  //Offset state <-------------------------------------
  double offset = 0.0;

  @override
  void initState() {
    super.initState();
    //print("init state is called");

    _scrollController = ScrollController() //keepScrollOffset: false removed
      ..addListener(() {
        setState(() {
          //<-----------------------------
          offset = _scrollController.offset;
          // force a refresh so the app bar can be updated
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppExit _appExit = AppExit(context);
    ScreenSize _screen = ScreenSize(context);
    return WillPopScope(
      onWillPop: _appExit.onWillPop,
      child: LibraryScaffold(
        title: _screen.isMobile ? 'Menu' : 'Users and their library',
        body: Container(
          child: _screen.isMobile
              ? mobileDashboard(_screen)
              : tabletDashboard(_screen),
        ),
      ),
    );
  }

  Widget mobileDashboard(_screen) {
    return GridView.count(
      addAutomaticKeepAlives: true,
      padding: const EdgeInsets.only(top: 10, bottom: 100),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      crossAxisCount: 3,
      children: [
        ...libraryNavLinks
            .where((element) => element.isMobileShow == true)
            .map((NavItem navItem) {
          return DashboardMenuButton(
            navItem: navItem,
          );
        }).toList()
      ],
    );
  }

  Widget tabletDashboard(ScreenSize _screen) {
    return CardContainer(
      height: 250,
      margin: const EdgeInsets.only(top: 10),
      child: Image.asset('assets/img/old-library.jpg'),
    );
  }
}
