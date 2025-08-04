import 'package:wbid/constents/constents.dart';
import 'package:flutter/material.dart';
import 'package:wbid/screens/homeScreens/home_screen.dart';
import 'package:wbid/screens/homeScreens/my_auctions_screen.dart';
import 'package:wbid/screens/homeScreens/profile_screen.dart';
import 'package:wbid/screens/homeScreens/selling_screen.dart';
import 'package:wbid/screens/homeScreens/test.dart';
import 'package:wbid/screens/homeScreens/wallet_screen.dart';
import 'package:wbid/screens/logInScreens/confirme_screen.dart';
import 'package:wbid/screens/logInScreens/forgot_password_screen.dart';
import 'package:wbid/screens/logInScreens/log_in_screen.dart';
import 'package:wbid/screens/logInScreens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: myColor3,
            ),
      ),
      initialRoute: LogInScreen.id,
      routes: {
        LogInScreen.id: (context) => const LogInScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        ConfirmeScreen.id: (context) => const ConfirmeScreen(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        HomeScreen.id: (context) =>  const HomeScreen(),
        WalletScreen.id: (context) => const WalletScreen(),
        MyAuctionsScreen.id: (context) => const MyAuctionsScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        SellingScreen.id: (context) => const SellingScreen(),
        Test.id: (context) => const Test(),
      },
    );
  }
}
