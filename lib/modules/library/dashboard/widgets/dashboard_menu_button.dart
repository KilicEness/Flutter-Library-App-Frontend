import 'package:library_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

//Shared
import 'package:library_app/shared/constants/nav_links.dart';
import 'package:library_app/shared/helpers/modular_navigator.dart';
import 'package:library_app/shared/widgets/layouts/card_container.dart';

class DashboardMenuButton extends StatelessWidget {
  NavItem navItem;

  DashboardMenuButton({Key? key, required this.navItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ModularNavigator.toPush(navItem.path);
        },
        child: CardContainer(
          color: AppColors.mainCardBgColor,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                navItem.icon,
                size: 34.0,
                color: AppColors.mainCardIconColor,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(
                  navItem.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.mainCardIconColor,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
