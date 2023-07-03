import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:library_app/shared/widgets/buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';

//Shared
import '../../helpers/screen_size.dart';
import '../indicators/custom_loading_indicator.dart';

class AlertModal {
  final BuildContext context;

  AlertModal({required this.context});

  void verify({
    required String title,
    required String description,
    dynamic Function()? btnOkOnPress,
    dynamic Function()? btnCancelOnPress,
    String? btnOkText,
    String? btnCancelText,
  }) {
    ScreenSize _screen = ScreenSize(context);

    AwesomeDialog(
            dialogBorderRadius: const BorderRadius.all(Radius.circular(4)),
            buttonsBorderRadius: const BorderRadius.all(Radius.circular(4)),
            buttonsTextStyle: const TextStyle(fontSize: 14),
            dismissOnTouchOutside: false,
            width: _screen.isDesktop ? 450 : _screen.width - 20,
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            btnOkOnPress: btnOkOnPress,
            btnOkText: btnOkText,
            btnCancelText: btnCancelText,
            btnCancelOnPress: btnCancelOnPress)
        .show();
  }

  void success({
    required String title,
    required String description,
    dynamic Function()? btnOkOnPress,
    dynamic Function()? btnCancelOnPress,
    String? btnOkText,
    String? btnCancelText,
  }) {
    ScreenSize _screen = ScreenSize(context);

    AwesomeDialog(
            dialogBorderRadius: const BorderRadius.all(Radius.circular(4)),
            buttonsBorderRadius: const BorderRadius.all(Radius.circular(4)),
            dismissOnTouchOutside: false,
            width: _screen.isDesktop ? 450 : _screen.width - 20,
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            btnOkOnPress: btnOkOnPress,
            btnOkText: btnOkText,
            btnCancelText: btnCancelText,
            btnCancelOnPress: btnCancelOnPress)
        .show();
  }

  void fail({
    required String title,
    required String description,
    dynamic Function()? btnOkOnPress,
    dynamic Function()? btnCancelOnPress,
    String? btnOkText,
    String? btnCancelText,
  }) {
    ScreenSize _screen = ScreenSize(context);

    AwesomeDialog(
            dialogBorderRadius: const BorderRadius.all(Radius.circular(4)),
            buttonsBorderRadius: const BorderRadius.all(Radius.circular(4)),
            dismissOnTouchOutside: false,
            width: _screen.isDesktop ? 450 : _screen.width - 20,
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            btnOkOnPress: btnOkOnPress,
            btnOkText: btnOkText,
            btnCancelText: btnCancelText,
            btnCancelOnPress: btnCancelOnPress)
        .show();
  }

  void waiting({required String title, required Function() onClose}) {
    ScreenSize _screen = ScreenSize(context);

    AwesomeDialog(
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(4)),
      dialogBorderRadius: const BorderRadius.all(Radius.circular(4)),
      dismissOnTouchOutside: false,
      onDissmissCallback: onClose(),
      width: _screen.isDesktop ? 450 : _screen.width - 20,
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              const CustomLoadingIndicator()
            ],
          ),
        ),
      ),
    ).show();
  }

  void custom(
      {required String title,
      bool dismissOnTouchOutside = false,
      dynamic Function(DismissType)? onClose,
      dynamic Function()? btnOkOnPress,
      dynamic Function()? btnCancelOnPress,
      String? btnOkText,
      String? btnCancelText,
      double? width,
      required Widget body}) {
    ScreenSize _screen = ScreenSize(context);

    AwesomeDialog(
            buttonsBorderRadius: const BorderRadius.all(Radius.circular(4)),
            dialogBorderRadius: const BorderRadius.all(Radius.circular(4)),
            dismissOnTouchOutside: dismissOnTouchOutside,
            onDissmissCallback: onClose,
            width: width ?? (_screen.isDesktop ? 450 : _screen.width - 20),
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.NO_HEADER,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    body
                  ],
                ),
              ),
            ),
            btnOkOnPress: btnOkOnPress,
            btnOkText: btnOkText,
            btnCancelText: btnCancelText,
            btnCancelOnPress: btnCancelOnPress)
        .show();
  }
}
