import 'package:flutter/material.dart';
import 'text_style_constents.dart';
import 'constents.dart';

//---------------------------------log in screen texts-------------------------------
const appBarTextInloginAndSignup = Text(
  nameOfApp,
  style: f50C3TextStyle,
  textAlign: TextAlign.center,
);

const welcomeText = Text(
  'Welcome',
  style: f30BlackTextStyle,
  textAlign: TextAlign.center,
);

const welcomeContentText = Text(
  'Please login or sign up to continue using our app',
  style: f14GreyTextStyle,
  textAlign: TextAlign.center,
);

const dontHaveAnAccountText = Text(
  'Don\'t have an account ? \n Swipe right to create a new account',
  style: f14GreyTextStyle,
  textAlign: TextAlign.center,
);

const forgotPasswordTextCRed = Text(
  'Forgot Password ?',
  style: f14RedTextStyle,
  textAlign: TextAlign.center,
);

const creatingAccountText = Text(
  'By creating an account you agree to our\n',
  style: f14GreyTextStyle,
  textAlign: TextAlign.center,
);
const termsOfServiceText = Text(
  'terms of service',
  style: f14RedTextStyle,
);
const andText = Text(
  ' and ',
  style: f14GreyTextStyle,
);
const privacyPolicyText = Text(
  'privacy policy',
  style: f14RedTextStyle,
);

const sendMessageToPhoneText = Text(
  'We send a message to your email',
  style: f14GreyTextStyle,
  textAlign: TextAlign.center,
);

const enterCodeText = Text(
  'Enter the code',
  style: f20BlackTextStyle,
  textAlign: TextAlign.center,
);

const forgotPasswordText = Text(
  'Forgot Password',
  style: TextStyle(
    fontSize: 14,
    color: Colors.black,
    decoration: TextDecoration.underline,
  ),
  textAlign: TextAlign.center,
);

const newPasswordText = Text(
  'New Password',
  style: f14GreyTextStyle,
  textAlign: TextAlign.center,
);

const contentTextOfForgotPasswordScreen = Text(
  'Enter the email you used to create your \naccount and we will send a message\n to reset your password',
  style: f14GreyTextStyle,
  textAlign: TextAlign.center,
);

const resendText = Text(
  'resend',
  style: f14GreyTextStyle,
);

//-----------------------------------home screen text-----------------------------------

const appBarTextInHomeScreens = Text(
  nameOfApp,
  style: f30C3TextStyle,
);

const happeningNowText = Padding(
  padding: EdgeInsets.only(left: 20),
  child: Text(
    'Happening Now',
    style: f30BlackTextStyle,
  ),
);

const lastBidValueText = Padding(
  padding: EdgeInsets.symmetric(horizontal: 20.0),
  child: Text(
    'Last bids value',
    style: f30BlackTextStyle,
  ),
);

const walletFillRequestText = Padding(
  padding: EdgeInsets.all(20.0),
  child: Text(
    'Wallet Fill Requests :',
    style: f20BlackTextStyle,
  ),
);

const productInformationText = Padding(
  padding: EdgeInsets.only(left: 20),
  child: Text(
    'Product Information',
    style: f30C2TextStyle,
  ),
);

const biddingInformationText = Padding(
  padding: EdgeInsets.only(left: 20),
  child: Text(
    'Bidding Information',
    style: f30C2TextStyle,
  ),
);

const lastTransactionText = Padding(
  padding: EdgeInsets.only(left: 20),
  child: Text(
    'Last Transaction',
    style: f30BlackTextStyle,
  ),
);

//-----------------------------------my actions------------------------------

const appBarTextInMyActionsScreen = Text(
  'My Auctions',
  style: f30C3TextStyle,
);

const appBarTextInProfileScreen = Text(
  'Profile',
  style: f30C3TextStyle,
);

const appBarTextInWalletScreen = Text(
  'Wallet',
  style: f30C3TextStyle,
);

//-------------------------------- selling screen text---------------------------------------

const sellingText = Text(
  'Selling',
  style: f30C3TextStyle,
);

const addPhotoText = Padding(
  padding: EdgeInsets.only(left: 30),
  child: Text(
    'attach product photos',
    style: f20BlackTextStyle,
    textAlign: TextAlign.left,
  ),
);

//--------------------------------drawer---------------------

const notificationText = Text(
  'Notification',
  style: f16BlackTextStyle,
);

const messageText = Text(
  'Messages',
  style: f16BlackTextStyle,
);

const savedText = Text(
  'Favorite',
  style: f16BlackTextStyle,
);

const signUpTextInDrawer = Text(
  'Sign Up',
  style: f16BlackTextStyle,
);

const logOutText = Text(
  'Log Out',
  style: f16BlackTextStyle,
);

const helpText = Text(
  'Help',
  style: f16BlackTextStyle,
);

const contactUsText = Text(
  'Contact Us',
  style: f16BlackTextStyle,
);

const settingText = Text(
  'Setting',
  style: f16BlackTextStyle,
);
