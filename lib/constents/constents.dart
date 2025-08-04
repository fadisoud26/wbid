import 'package:flutter/material.dart';

double? heightOfScreen;
double? widthOfScreen;
double? appBarHeight;
String? publicPhoneNumber;
String? publicEmail;
String? publicBankAccount;
String? publicBankAccountPassword;
String? publicUserName;
String? publicPassword;
String? publicFirstName;
String? publicLastName;
String? publicAmount;
String? publicMemberSince;

const String loginAndSignupConfApiIfOk = 'Wellcome In W_BID';
const String loginApiIfInvalid = 'Your User Name Or Password Is Not Correct';
const String signupApiIfInvalid = 'You Can\'t Use This User Name ,Beacuse It\'s Taken';
const String confirmeApiIfInvalid = 'Your Code Is Invalid';
const String forgotPasswordApiIfInvalid = 'Your Email is not correct';
const String forgotPasswordConfirmeApiIfOk = 'It\'s Done ,Don\'t Forget Your Password';
const String noInternetConection = 'Make Sure You\'re Connected To The Internet';
const String sellingApiIfOk = 'Your Offer Is Add To Sell';
const String sellingApiIfInvalid = 'Your Offer Doesn\'t Meet Standards';
const String bidNowApiIfOk = 'Your Bid Is Complete';
const String bidNowApiIfInvalid = 'Your Bid Was Not Completed , Try Again';


const String profileImage = 'images/boy4.jpg';
const String sellerAndBuyerImage = 'images/boy1.jpg';
const String backgroundimage = 'images/bid2.jpg';

const String nameOfApp = 'W-Bid';
const String logInText = 'Log In';
const String signUpText = 'Sign Up';

const Color myColor1 = Color(0xFF072227);
const Color myColor2 = Color(0xFF35858B);
const Color myColor3 = Color(0xFF4FBDBA);
const Color myColor4 = Color(0xFFAEFEFF);
const Color myGreyColor = Color(0xFFF1F3F5);

const sBoxH50 = SizedBox(height: 50);
const sBoxH30 = SizedBox(height: 30);
const sBoxH20 = SizedBox(height: 20);
const sBoxH10 = SizedBox(height: 10);

const sBoxW50 = SizedBox(width: 50);
const sBoxW30 = SizedBox(width: 30);
const sBoxW20 = SizedBox(width: 20);
const sBoxW10 = SizedBox(width: 10);

enum TypeNameOfField {
  email,
  password,
  bankAccount,
  passwordBandkAccount,
  phoneNumber,
  userName,
  text,
  bidNumber,
  firstName,
  secondName,
}

enum DecorationOf {
  first,
  second,
  third,
  fourth,
}

enum WhereIAmRightNow {
  home,
  wallet,
  myAuctions,
  profile,
}

enum TimeOrDate {
  time,
  date,
}
