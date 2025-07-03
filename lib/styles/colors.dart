part of 'styles.dart';

class AppColor {
  static const Color primaryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryColor = Color.fromARGB(255, 14, 25, 52);

  static const Color ternaryColor = Color.fromARGB(255, 16, 52, 115);
  static const Color specialColor = Color.fromARGB(255, 236, 241, 248);
}

class HintColor {
  static const Color primaryColor = Color.fromARGB(255, 170, 176, 187);
  static const Color secondaryColor = Color.fromARGB(255, 51, 51, 51);
  static const Color ternaryColor = Color.fromARGB(5, 14, 14, 44);
  static const Color quaternaryColor = Color.fromARGB(255, 217, 223, 235);
}

class TextColor {
  static const Color primaryColor = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color ternaryColor = Color.fromARGB(255, 14, 25, 52);
  static const Color quaterneryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color specialColor = Color.fromARGB(255, 47, 128, 237);
  static const Color enquiryColor = Color.fromARGB(255, 80, 95, 121);
}

class MiniTextColor {
  static const Color primaryColor = Color.fromARGB(255, 0, 0, 0);
  static const Color seconadryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color ternaryColor = Color.fromARGB(255, 14, 14, 44);
  static const Color quaternaryColor = Color.fromARGB(255, 153, 27, 27);
  static const Color specialColor = Color.fromARGB(255, 84, 124, 194);
}

class ButtonColor {
  static const Color primaryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryColor = Color.fromARGB(255, 14, 25, 52);

  static const Color ternaryColor = Color.fromARGB(255, 20, 105, 242);
  static const Color quaternaryColor = Color.fromARGB(255, 16, 52, 115);
  static const Color specialColor = Color.fromARGB(255, 47, 128, 237);
  static const Color errorColor = Color.fromARGB(255, 127, 29, 29);
}

class CircleColor {
  static const Color primaryColor = Color.fromARGB(255, 16, 52, 115);
  static const Color secondaryColor = Color.fromARGB(255, 18, 78, 179);
  static const Color ternaryColor = Color.fromARGB(255, 20, 105, 242);
  static const Color quaternaryColor = Color.fromARGB(255, 170, 176, 187);
  static const Color specialColor = Color.fromARGB(255, 242, 201, 76);
  static const Color specialCircleColor = Color.fromARGB(255, 20, 105, 242);
}

class IconColors {
  static const Color primaryColor = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryColor = Color.fromARGB(255, 255, 255, 255);
  static const Color ternaryColor = Color.fromARGB(255, 153, 153, 153);
  static const Color specialColor = Color.fromARGB(255, 20, 105, 242);
}

class CreateEnquiryColors {
  static const Color primaryColor = Color.fromARGB(255, 223, 225, 230);
  static const Color secondaryColor = Color.fromARGB(255, 246, 251, 255);
  static const Color toggleTextColor = Color.fromARGB(255, 82, 127, 165);
  static const Color headerTextColor = Color.fromARGB(255, 20, 105, 242);
}

class SpecialColors {
  static const Color primaryColor = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryColor = Color.fromARGB(255, 153, 153, 153);
  static const Color ternaryColor = Color.fromARGB(255, 18, 78, 179);
  static const Color quaternaryColor = Color.fromARGB(255, 254, 226, 226);
}

class ChoiceColor {
  static const Color activeColor = Color.fromARGB(255, 6, 78, 59);
  static const Color newColor = Color.fromARGB(255, 12, 74, 110);
  static const Color suspendedColor = Color.fromARGB(255, 127, 29, 29);
  static const Color quotedColor = Color.fromARGB(255, 132, 77, 15);

  static const Color issuedColor = Color.fromARGB(255, 85, 60, 154);
}
//-----------------------------------------------------------------------------------------------------------------------

/// Defines color palettes for primary, secondary, and error categories within the application.
/// Each color is defined using `Color.fromRGBO`, providing precise control over the color and opacity used in the app's design.
class Primary {
  static const Color primary25 = Color.fromRGBO(249, 251, 255, 1);
  static const Color primary50 = Color.fromRGBO(242, 246, 254, 1);
  static const Color primary75 = Color.fromRGBO(232, 237, 251, 1);
  static const Color primary100 = Color.fromRGBO(187, 202, 243, 1);
  static const Color primary200 = Color.fromRGBO(142, 167, 236, 1);
  static const Color primary300 = Color.fromRGBO(97, 131, 228, 1);
  static const Color primary400 = Color.fromRGBO(52, 96, 220, 1);
  static const Color primary500 = Color.fromRGBO(29, 78, 216, 1);
  static const Color primary600 = Color.fromRGBO(23, 62, 173, 1);
  static const Color primary700 = Color.fromRGBO(17, 47, 130, 1);
  static const Color primary800 = Color.fromRGBO(12, 31, 86, 1);
  static const Color primary900 = Color.fromRGBO(6, 16, 43, 1);
}

class Secondary {
  static const Color secondary50 = Color.fromRGBO(254, 250, 237, 1);
  static const Color secondary100 = Color.fromRGBO(253, 240, 200, 1);
  static const Color secondary200 = Color.fromRGBO(251, 231, 163, 1);
  static const Color secondary300 = Color.fromRGBO(249, 221, 126, 1);
  static const Color secondary400 = Color.fromRGBO(248, 211, 89, 1);
  static const Color secondary500 = Color.fromRGBO(247, 206, 70, 1);
  static const Color secondary600 = Color.fromRGBO(198, 165, 56, 1);
  static const Color secondary700 = Color.fromRGBO(148, 124, 42, 1);
  static const Color secondary800 = Color.fromRGBO(99, 82, 28, 1);
  static const Color secondary900 = Color.fromRGBO(49, 41, 14, 1);
}

class Error {
  static const Color error50 = Color.fromRGBO(254, 242, 242, 1);
  static const Color error100 = Color.fromRGBO(254, 226, 226, 1);
  static const Color error200 = Color.fromRGBO(254, 202, 202, 1);
  static const Color error300 = Color.fromRGBO(252, 165, 165, 1);
  static const Color error400 = Color.fromRGBO(248, 113, 113, 1);
  static const Color error500 = Color.fromRGBO(239, 68, 68, 1);
  static const Color error600 = Color.fromRGBO(220, 38, 38, 1);
  static const Color error700 = Color.fromRGBO(185, 28, 28, 1);
  static const Color error800 = Color.fromRGBO(153, 27, 27, 1);
  static const Color error900 = Color.fromRGBO(127, 29, 29, 1);
}

class Success {
  static const Color success50 = Color.fromRGBO(236, 253, 245, 1);
  static const Color success100 = Color.fromRGBO(209, 250, 229, 1);
  static const Color success200 = Color.fromRGBO(167, 243, 208, 1);
  static const Color success300 = Color.fromRGBO(110, 231, 183, 1);
  static const Color success400 = Color.fromRGBO(52, 211, 153, 1);
  static const Color success500 = Color.fromRGBO(16, 185, 129, 1);
  static const Color success600 = Color.fromRGBO(5, 150, 105, 1);
  static const Color success700 = Color.fromRGBO(4, 120, 87, 1);
  static const Color success800 = Color.fromRGBO(6, 95, 70, 1);
  static const Color success900 = Color.fromRGBO(6, 78, 59, 1);
}

class Warning {
  static const Color warning50 = Color.fromRGBO(255, 251, 235, 1);
  static const Color warning100 = Color.fromRGBO(254, 243, 199, 1);
  static const Color warning200 = Color.fromRGBO(253, 230, 138, 1);
  static const Color warning300 = Color.fromRGBO(252, 211, 77, 1);
  static const Color warning400 = Color.fromRGBO(251, 191, 36, 1);
  static const Color warning500 = Color.fromRGBO(245, 158, 11, 1);
  static const Color warning600 = Color.fromRGBO(217, 119, 6, 1);
  static const Color warning700 = Color.fromRGBO(180, 83, 9, 1);
  static const Color warning800 = Color.fromRGBO(146, 64, 14, 1);
  static const Color warning900 = Color.fromRGBO(120, 53, 15, 1);
}

class Neutral {
  static const Color n20 = Color.fromRGBO(245, 246, 247, 1);
  static const Color n25 = Color.fromRGBO(250, 250, 250, 1);
  static const Color n50 = Color.fromRGBO(247, 248, 249, 1);
  static const Color n75 = Color.fromRGBO(241, 243, 245, 1);
  static const Color n100 = Color.fromRGBO(231, 234, 238, 1);
  static const Color n200 = Color.fromRGBO(216, 220, 226, 1);
  static const Color n300 = Color.fromRGBO(192, 199, 209, 1);
  static const Color n400 = Color.fromRGBO(168, 176, 191, 1);
  static const Color n500 = Color.fromRGBO(100, 116, 136, 1);
  static const Color n600 = Color.fromRGBO(75, 87, 102, 1);
  static const Color n700 = Color.fromRGBO(50, 58, 68, 1);
  static const Color n800 = Color.fromRGBO(37, 44, 51, 1);
  static const Color n900 = Color.fromRGBO(13, 15, 17, 1);
}

class Shades {
  static const Color s06 = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color s0 = Color.fromRGBO(255, 255, 255, 1);
  static const Color s100 = Color.fromRGBO(0, 0, 0, 1);
}

class DarkMode {
  static const Color d50 = Color.fromRGBO(57, 61, 73, 1);
  static const Color d100 = Color.fromRGBO(54, 59, 71, 1);
  static const Color d200 = Color.fromRGBO(52, 56, 68, 1);
  static const Color d300 = Color.fromRGBO(47, 52, 64, 1);
  static const Color d400 = Color.fromRGBO(45, 49, 62, 1);
  static const Color d500 = Color.fromRGBO(40, 45, 58, 1);
  static const Color d600 = Color.fromRGBO(38, 42, 55, 1);
  static const Color d700 = Color.fromRGBO(36, 40, 53, 1);
  static const Color d800 = Color.fromRGBO(31, 36, 49, 1);
  static const Color d900 = Color.fromRGBO(19, 24, 38, 1);
}

class Additional {
  static const Color amber = Color.fromRGBO(255, 125, 4, 1);
  static const Color grey = Color.fromRGBO(122, 134, 153, 1);
  static const Color violet = Color.fromRGBO(99, 70, 163, 1);
  static const Color darkViolet = Color.fromRGBO(62, 29, 137, 1);
  static const Color lightViolet = Color.fromRGBO(114, 98, 200, 1);
  static const Color lightViolet1 = Color.fromRGBO(220, 204, 255, 1);
  static const Color lightWhite = Color.fromRGBO(231, 241, 255, 1);
  static const Color purble = Color.fromRGBO(74, 56, 172, 1);
  static const Color pink = Color.fromRGBO(150, 102, 189, 1);
  static const Color blue = Color.fromRGBO(11, 84, 181, 1);
  static const Color coolGray = Color.fromARGB(255, 170, 176, 187);
}

 
 
 
//-------------------------------------------------------------------------------------------------------------------------------------------- 