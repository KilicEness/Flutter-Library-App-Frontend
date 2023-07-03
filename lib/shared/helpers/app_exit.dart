import 'package:library_app/shared/widgets/modal/alert_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AppExit {
  BuildContext context;
  AppExit(this.context);

  Future<bool> onWillPop() async {
    if (!kIsWeb) {
      AlertModal(context: context).verify(
          title: "Uygulamadan çıkıyorsunuz",
          description: "Uygulamadan çıkmak için onaylanamanız gerekmektedir.",
          btnOkText: "Çıkış Yap",
          btnCancelText: "Vazgeç",
          btnOkOnPress: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          btnCancelOnPress: () {});
      return true;
    } else {
      return false;
    }
  }
}
