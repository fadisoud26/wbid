import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/icon_constents.dart';
import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:flutter/material.dart';
import 'package:wbid/function/function.dart';
import 'package:wbid/screens/logInScreens/log_in_screen.dart';
import 'package:wbid/screens/logInScreens/sign_up_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  void _onTapSignUp() {
    Navigator.pushReplacementNamed(context, SignUpScreen.id);
  }

  void _onTapLogOut() {
    logoutWithSaredPref();
    Navigator.pushReplacementNamed(context, LogInScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundimage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    accountName: Text(
                      publicUserName ?? '',
                      style: f20BlackTextStyle,
                    ),
                    accountEmail: Text(
                      publicEmail ?? '',
                    ),
                    currentAccountPicture: const CircleAvatar(
                      radius: 22.0,
                      backgroundImage: AssetImage(profileImage),
                    ),
                  ),
                  ListTile(
                    title: notificationText,
                    leading: IconButton(
                      icon: notificationIcon,
                      onPressed: () async {},
                    ),
                  ),
                  ListTile(
                    title: messageText,
                    leading: IconButton(
                      icon: messageIcon,
                      onPressed: () async {},
                    ),
                  ),
                  ListTile(
                    title: savedText,
                    leading: IconButton(
                      icon: savedIcon,
                      onPressed: () async {},
                    ),
                  ),
                  ListTile(
                    title: signUpTextInDrawer,
                    leading: IconButton(
                      icon: logInIcon,
                      onPressed: () async {
                        _onTapSignUp();
                      },
                    ),
                    onTap: () async {
                      _onTapSignUp();
                    },
                  ),
                  ListTile(
                    title: logOutText,
                    leading: IconButton(
                      icon: logOutIcon,
                      onPressed: () async {
                        _onTapLogOut();
                      },
                    ),
                    onTap: () async {
                      _onTapLogOut();
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Divider(
                      thickness: 1.5,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: helpText,
                    leading: IconButton(
                      icon: helpIcon,
                      onPressed: () async {},
                    ),
                  ),
                  ListTile(
                    title: contactUsText,
                    leading: IconButton(
                      icon: contactUsIcon,
                      onPressed: () async {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 6),
              child: ListTile(
                hoverColor: Colors.deepOrange.shade300,
                title: settingText,
                leading: IconButton(
                  icon: settingIcon,
                  onPressed: () async {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
