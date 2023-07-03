import 'package:library_app/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../layouts/card_container.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onClick;
  final String label;
  final double height;
  IconData? icon;
  final Color? color;
  CustomElevatedButton(
      {Key? key,
      this.onClick,
      required this.label,
      this.height = 40,
      this.color})
      : super(key: key);

  CustomElevatedButton.withIcon(
      {Key? key,
      this.onClick,
      required this.label,
      this.height = 40,
      this.color,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: CardContainer(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        borderRadius: 4,
        height: height,
        color: onClick != null
            ? color ?? AppColors.primayBgColor
            : const Color.fromRGBO(160, 166, 171, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              (Icon(
                icon,
                color: color != null && color == AppColors.warningBgColor
                    ? Colors.black
                    : Colors.white,
              )),
            if (icon != null)
              (const SizedBox(
                width: 5,
              )),
            Text(label,
                style: TextStyle(
                    color: color != null && color == AppColors.warningBgColor 
                        ? Colors.black
                        : Colors.white)),
          ],
        ),
      ),
    );
  }
}
