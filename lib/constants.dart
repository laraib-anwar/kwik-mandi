import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFb21778);

const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const k1 = Color(0xFF84235D);
const k2 = Color(0xFFB22178);
const kButtonColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF84235D), Color(0xFFB22178)],
);
const kSecondaryColor = Color(0xFFff5f1b);
const kTextFieldColor = Color(0xFFededed);
const kTextColor = Color(0xFF757575);

const kBadgeOrange = Color(0xFFffe5d1);
const kBadgeBlue = Color(0xFFe1eaff);
const kBadgeGreen = Color(0xFFcefecd);
const kDivider = Color(0xFFc4c4c4);

const kSmallText = Color(0xFF4b4b4b);
const kGrey1 = Color(0xFF1b1b1b);
const kGrey2 = Color(0xFF4b4b4b);
const kGrey3 = Color(0xFF7a7a7a);
const kGrey5 = Color(0xFFb3b3b3);
const kGrey6 = Color(0xFFededed);

const kSwitch = Color(0xFF08A605);

const kTextTabColor = Color(0xFF7a7a7a);
const kIconBackColor = Color(0xFF1b1b1b);

const kShadow = Color.fromRGBO(0, 0, 0, 0.05);

const double headerFontSize = 20;

const kAnimationDuration = Duration(milliseconds: 200);



const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kOtpSuccess =
    "Note: The 5 digit OTP was successfully sent to your phone number.Please enter the correct OTP";
const String kOtpEnter = 'Enter your OTP';
const String kPhoneLengthError = 'Phone length must have length of 10 digits';
const String kShortPassError = "Password is too short";
const String kMatchOtpError = "Otp did not match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberError = 'Phone number does not exist';
const String kOtpError = "Otp must be five characters";
const String kOrdersMsg = "There are no new orders at this moment";


//socket events constants
const String ON_CONNECTION = "connect";
const String ON_RECONNECTION = "reconnect";
const String CONNECTED = "connected";
const String NEW_ORDER = "new order placed";
const String BOY_ACCEPT = "boy accepted";
const String CUSTOMER_PAID = "customer paid";
const String PARTNER_NOT_ACCEPTED = "partner not accepted";
const String NO_BOYS_FOUND = "no boys found";
const String CUSTOMER_ORDER_CANCEL = "customer order cancel";
const String NO_BOY_ACCEPTED = "no boy accepted";
const String PARTNER_DELETE = "partner delete";
const String ASSIGN_MANUAL = "assign manual";
const String MODE_CHANGED = "mode changed";
const String CONNECT_ERROR = "connect_error";
const String RIDER_REACHED = "rider reached at restaurant";
const String BASE_ADDRESS = kReleaseMode
    ? "https://socket.fooza.in:4008/"
    : "https://demosocket.fooza.in:4008/";

enum OrderAction { NewOrder, AcceptOrder, Menu }

