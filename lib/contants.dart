import 'package:flutter/material.dart';

const kPrimaryDelivery = Color(0xFFFA974B);
const kPrimaryDeliveryLightColor = Color(0xFFFFE3B8);

const kPrimaryDelivery2 = Color(0xFFFE6745);
const kPrimaryDeliveryLightColor2 = Color(0xFFFFD8CC);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kblack = Colors.black87;
const kgreen = Colors.green;

const kAnimationDuration = Duration(milliseconds: 200);

// final headingStyle = TextStyle(
//   fontSize: getProportionateScreenWidth(28),
//   fontWeight: FontWeight.bold,
//   color: Colors.black,
//   height: 1.5,
// );

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


