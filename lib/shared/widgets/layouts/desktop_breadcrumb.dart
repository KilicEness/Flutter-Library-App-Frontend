// import 'package:library_app/shared/constants/app_colors.dart';
// import 'package:library_app/shared/helpers/screen_size.dart';
// import 'package:flutter/material.dart';

// class DesktopBreadcrump extends StatelessWidget {
//   final String title;
//   const DesktopBreadcrump({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ScreenSize _screen = ScreenSize(context);
//     return Container(
//       width: _screen.width - 237,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//           border: Border.all(color: AppColors.cardBorderColor),
//           color: AppColors.breadcrumbBgColor),
//       margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
//       child: Text(
//         title,
//         style: TextStyle(
//             color: AppColors.breadcrumbTextColor,
//             fontSize: 20,
//             fontWeight: FontWeight.w400),
//       ),
//     );
//   }
// }
