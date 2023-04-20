import 'package:flutter/material.dart';
import 'package:wefellowship/src/configs/configs.dart';

const String appName = 'wefellowship';

class AppAssetsPath {
  static const String heartSolid = 'assets/icons/heartS.svg';
  static const String heartOutline = 'assets/icons/heartT.svg';
  static const String chevronLeft = 'assets/icons/left.svg';
  static const String chevronRight = 'assets/icons/right.svg';
  static const String settings = 'assets/icons/settings.svg';
  static const String volume = 'assets/icons/volume.svg';
  static const String error = 'assets/icons/Error.svg';
  static const String fontfamily = '';
  static const String logo = 'assets/images/logo.png';
  static const String icon = 'assets/images/icon.png';
  static const String googleIcon = 'assets/icons/google.svg';
  static const String snackbarIcon = 'lib/assets/icons/snackicon.svg';
  static const String bubbles = 'lib/assets/icons/bubbles.svg';
  static const String help = 'assets/types/help.svg';
  static const String failure = 'assets/types/failure.svg';
  static const String success = 'assets/types/success.svg';
  static const String warning = 'assets/types/warning.svg';
  static const String delete = 'assets/types/trash.svg';
  static const String camera = 'assets/icons/camera.svg';
}

class FirebaseConstants {
  static const usersCollection = 'users';
  static const communitiesCollection = 'communities';
  static const chatsCollection = 'chats';
  static const postsCollection = 'posts';
  static const commentsCollection = 'comments';
}

const kPrimaryColor = Color(0xFFCBB26A);
const kFontfamily = 'Muli';
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);
// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
