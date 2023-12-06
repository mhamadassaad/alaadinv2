import 'package:flutter/material.dart';

class AppConfig {
  static const String hostUrl = 'http://10.0.2.2:8000';

  static String appName = 'Aladdin';

  static String loginBackgroundImage = 'assets/config/login_bg2.png';

  static String appLogo = 'assets/images/loadfanous.png';

  static String appBanner = 'assets/images/fanous.png';

  static const String assetPath = hostUrl + '/public';
  // static const String assetPath = hostUrl;

  static Color loginScreenBackgroundGradient1 = Color(0xff0e0c75);

  static Color loginScreenBackgroundGradient2 =
      Color.fromARGB(255, 23, 21, 150);

  static String appColorScheme = "#FF0e0c75";

  // static const String privacyPolicyUrl =
  // 'https://aladdinlb.com/terms-&-conditions';
  static const String privacyPolicyUrl =
      'https://aladdinlb.com/public/terms-&-conditions';

  static bool googleLogin = true;

  static bool facebookLogin = false;

  static bool isDemo = false;
}
