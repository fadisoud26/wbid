import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wbid/constents/constents.dart';
import 'package:wbid/dartClasses/user_data.dart';
import 'package:wbid/function/function.dart';
import 'package:wbid/screens/homeScreens/bid_now_screen.dart';
import 'package:wbid/screens/homeScreens/home_screen.dart';
import 'package:wbid/screens/homeScreens/selling_screen.dart';
import 'package:wbid/screens/logInScreens/confirme_screen.dart';
import 'package:wbid/screens/logInScreens/forgot_password_screen.dart';
import 'package:wbid/screens/logInScreens/log_in_screen.dart';
import 'package:wbid/screens/logInScreens/sign_up_screen.dart';
import 'package:wbid/widgets/my_botton_navigation_app_bar.dart';

class ApiData {
  static int? dataLenOfHome;
  static int? dataLenOfPayment;
  static int? dataLenOfPayout;
  static String baseURL = 'http://ghewazaloum.pythonanywhere.com/';
  static String loginURL = baseURL + "login";
  static String signupURL = baseURL + "signup";
  static String confirmURL = baseURL + "confirm";
  static String forgetPassConfirmURL = baseURL + 'confirm_password';
  static String forgetpassURL = baseURL + 'forget_password';
  static String sellingURL = baseURL + 'add_offer';
  static String addToBidURL = baseURL + 'add_to_bid';
  static String seeMoreURL = baseURL + 'see_more';
  static String happeningNowURL = baseURL + "happening_now";
  static String paymentURL = baseURL + "payment";
  static String payoutURL = baseURL + "payout";
  static Map<String, dynamic>? allUserInfoAsMap;
  static Map<String, dynamic>? allProductsAsMap;
  static Map<String, dynamic>? singleProductInfoAsMap = {'null': 'null'};
  static Map<String, dynamic>? singleProductInfoForBidNowAsMap;
  static Map<String, dynamic>? paymentAsMap;
  static Map<String, dynamic>? payoutAsMap;
  static Map<String, dynamic>? sellingAsMap;

//--------------------------start login API----------------------------
  static Future<dynamic> login({
    required String userName,
    required String passWord,
    required BuildContext context,
  }) async {
    http
        .post(
          Uri.parse(loginURL),
          body: jsonEncode(<String, String>{
            'username': userName,
            'password': passWord,
          }),
        )
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                {
                  snackBar(loginAndSignupConfApiIfOk, context),
                  allUserInfoAsMap = jsonDecode(value.body),
                  saveUserData(UserInfo.fromJson(ApiData.allUserInfoAsMap!)),
                  LogInScreen.loginNotify(context),
                }
              else if (jsonDecode(value.body)['result'] == 'invalid')
                snackBar(loginApiIfInvalid, context)
              else
                snackBar(noInternetConection, context),
            });
  }
  //------------------------------end login API -----------------------------

  // -----------------------Start signup API --------------------
  static Future<dynamic> signup({
    required String phoneNumber,
    required String email,
    required String bankAccount,
    required String bankAccountPassword,
    required String userName,
    required String password,
    required String firstName,
    required String lastName,
    required BuildContext context,
  }) async {
    
    http
        .post(
          Uri.parse(signupURL),
          body: jsonEncode(<String, dynamic>{
            'phone': phoneNumber,
            'email': email,
            'bankaccount': bankAccount,
            'bankpassword': bankAccountPassword,
            'username': userName,
            'password': password,
            'firstname': firstName,
            'lastname': lastName,
          }),
        )
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                SignUpScreen.signUpNotify(context)
              else if (jsonDecode(value.body)['result'] == 'invalid')
                snackBar(signupApiIfInvalid, context)
              else
                snackBar(noInternetConection, context),
            });
  }
  //-----------------------end signup API -----------------------------

  //------------------------start signupconfirm API-----------------------
  static Future<dynamic> signupConfirme({
    required String userName,
    required String code,
    required BuildContext context,
  }) async {
    http
        .post(
          Uri.parse(confirmURL),
          body: jsonEncode(<String, dynamic>{
            'code': code,
            'username': userName,
          }),
        )
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                {
                  snackBar(loginAndSignupConfApiIfOk, context),
                  allUserInfoAsMap = jsonDecode(value.body),
                  saveUserData(UserInfo.fromJson(ApiData.allUserInfoAsMap!)),
                  ConfirmeScreen.signUpConfirmeNotify(context),
                }
              else if (jsonDecode(value.body)['result'] == 'invalid')
                snackBar(confirmeApiIfInvalid, context)
              else
                snackBar(noInternetConection, context),
            });
  }
  //------------------------end signupconfirm API-----------------------

//------------------------start forgetpass API-----------------------
  static Future<dynamic> forgetpass({
    required String email,
    required String newPassword,
    required BuildContext context,
  }) async {
    http
        .post(Uri.parse(forgetpassURL),
            body: jsonEncode(<String, dynamic>{
              'email': email,
              'password': newPassword,
            }))
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                ForgotPasswordScreen.forgotPasswordNotify(context)
              else if (jsonDecode(value.body)['result'] == 'invalid')
                snackBar(forgotPasswordApiIfInvalid, context)
              else
                snackBar(noInternetConection, context),
            });
  }
  //------------------------end forgetpass API-----------------------

//------------------------start forgetpassconfirm API-----------------------
  static Future<dynamic> forgetpassConfirme({
    required String email,
    required String code,
    required BuildContext context,
  }) async {
    http
        .post(
          Uri.parse(forgetPassConfirmURL),
          body: jsonEncode(<String, dynamic>{
            'code': code,
            'email': email,
          }),
        )
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                {
                  snackBar(forgotPasswordConfirmeApiIfOk, context),
                  ConfirmeScreen.forgetPassConfirmeNotify(context)
                }
              else if (jsonDecode(value.body)['result'] == 'invalid')
                snackBar(confirmeApiIfInvalid, context)
              else
                snackBar(noInternetConection, context),
            });
  }
  //------------------------end forgetpassconfirm API-----------------------

//------------------------start selling API-----------------------
  static Future<dynamic> selling({
    required String userName,
    required String nameOfProduct,
    required String brand,
    required String yearModel,
    required String price,
    required String startdate,
    required String enddate,
    required String firstImage,
    required String secondImage,
    required String thirdImage,
    required String fourthImage,
    required String fifthImage,
    required String sixthImage,
    required BuildContext context,
  }) async {

    print('daas');
    print(userName);
    print(nameOfProduct);
    print(brand);
    print(yearModel);
    print(price);
    print(startdate);
    print(enddate);
   // print(firstImage);
    print('llllllllllllll');
    //print(sixthImage);
    
    http
        .post(
          Uri.parse(sellingURL),
          body: jsonEncode(<String, dynamic>{
            'productname': nameOfProduct,
            'brand': brand,
            'yearmodel': yearModel,
            'minimum_price': price,
            'auction_start_time': startdate,
            'auction_end_time': enddate,
            'username': userName,
            'imgurl1': firstImage,
            'imgurl2': secondImage,
            'imgurl3': thirdImage,
            'imgurl4': fourthImage,
            'imgurl5': fifthImage,
            'imgurl6': sixthImage,
          })
        )
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                {
                  snackBar(sellingApiIfOk, context),
                  sellingAsMap = jsonDecode(value.body),
                  SellingScreen.sellingNotify(context)
                }
              else if (jsonDecode(value.body)['result'] == 'invalid')
                snackBar(sellingApiIfInvalid, context)
              else
                snackBar(noInternetConection, context),

                print(jsonDecode(value.body)['result']),
                print (jsonDecode(value.body)),
                print('fadi'),
            });
  }

//------------------------end selling API-----------------------

//------------------------start homeScreen API-----------------------
  static Future<dynamic> homeScreenApi() async {
    http.get(Uri.parse(happeningNowURL)).then((value) => {
          if (jsonDecode(value.body)['result'] == 'ok')
            {
              allProductsAsMap = jsonDecode(value.body),
              dataLenOfHome = allProductsAsMap!['data_len'],
            }
        });
  }
  //--------------------------end homeScren API-------------------

//------------------------start payment API-----------------------
  static Future<dynamic> payment({
    required String userName,
  }) async {
    http
        .post(Uri.parse(paymentURL),
            body: jsonEncode(<String, String>{
              'username': userName,
            }))
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                {
                  paymentAsMap = jsonDecode(value.body),
                  dataLenOfPayment = paymentAsMap!['data_len'],
                },
            });
  }

  static Future<dynamic> paymentWithNotify({
    required String userName,
    required BuildContext context,
  }) async {
    http
        .post(Uri.parse(paymentURL),
            body: jsonEncode(<String, String>{
              'username': userName,
            }))
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                {
                  paymentAsMap = jsonDecode(value.body),
                  dataLenOfPayment = paymentAsMap!['data_len'],
                  MyBottonNavigationAppBar
                      .goFromNavigationAppBarToMyAuctionNotify(context),
                },
            });
  }
  //--------------------------end payment API-------------------

//------------------------start payout API-----------------------
  static Future<dynamic> payout({
    required String userName,
  }) async {
    http
        .post(Uri.parse(payoutURL),
            body: jsonEncode(<String, String>{
              'username': userName,
            }))
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                {
                  payoutAsMap = jsonDecode(value.body),
                  dataLenOfPayout = payoutAsMap!['data_len'],
                },
            });
  }
  //--------------------------end payout API-------------------

//----------------------- start seemore API-----------------------------
  static Future<dynamic> seeMoreWithNotify({
    required String nameOfProduct,
    required BuildContext context,
    required int i,
  }) async {
    http
        .post(
          Uri.parse(seeMoreURL),
          body: jsonEncode(<String, String>{
            'offername': nameOfProduct,
          }),
        )
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                {
                  singleProductInfoAsMap = jsonDecode(value.body),
                  (i == 0)
                      ? HomeScreen.seeMoreNotify(context)
                      : HomeScreen.bidNowNotify(context),
                },
            });
  }

  static Future<dynamic> seeMore({
    required String nameOfProduct,
  }) async {
    http
        .post(
          Uri.parse(seeMoreURL),
          body: jsonEncode(<String, String>{
            'offername': nameOfProduct,
          }),
        )
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                singleProductInfoAsMap = jsonDecode(value.body),
            });
  }
//-----------------------end seemore API--------------------------------

//----------------------- start seemore API-----------------------------
  static Future<dynamic> bidNow({
    required String nameOfProduct,
    required String userName,
    required String amount,
    required BuildContext context,
  }) async {
    http
        .post(
          Uri.parse(addToBidURL),
          body: jsonEncode(<String, String>{
            'offername': nameOfProduct,
            'username': userName,
            'ammount': amount,
          }),
        )
        .then((value) => {
              if (jsonDecode(value.body)['result'] == 'ok')
                {
                  singleProductInfoForBidNowAsMap = jsonDecode(value.body),
                  snackBar(bidNowApiIfOk, context),
                  BidNowScreen.bidNowNotify(context),
                }
              else if (jsonDecode(value.body)['result'] == 'invalid')
                snackBar(bidNowApiIfInvalid, context)
              else
                snackBar(noInternetConection, context),
            });
  }
//-----------------------end seemore API--------------------------------

}
