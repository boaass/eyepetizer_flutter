import 'package:url_launcher/url_launcher.dart';

class ZCLUtils {
  static launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static String secondToTimeText(int seconds) {
    var sec = seconds % 60;
    var minute = seconds ~/ 60 % 60;
    var hour = seconds ~/ 60 ~/ 60 % 24;

    return "${minute < 10 ? '0$minute' : minute}:${sec < 10 ? '0$sec' : sec}";
  }
}