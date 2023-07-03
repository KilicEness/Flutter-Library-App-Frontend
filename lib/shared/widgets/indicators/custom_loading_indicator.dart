import 'package:library_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}
