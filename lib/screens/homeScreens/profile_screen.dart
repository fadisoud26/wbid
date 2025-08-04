import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/widgets/drawer_widget.dart';
import 'package:wbid/widgets/material_widget.dart';
import 'package:wbid/widgets/my_botton_navigation_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:wbid/widgets/row_profile_information_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = 'profile_screen';
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: const SafeArea(
        child: DrawerWidget(),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: appBarHeight,
          elevation: 0,
          backgroundColor: Colors.white,
          title: appBarTextInProfileScreen,
          leading: IconButton(
            onPressed: () {
              (scaffoldkey.currentState!.isDrawerOpen == false)
                  ? scaffoldkey.currentState!.openDrawer()
                  : scaffoldkey.currentState!.openEndDrawer();
            },
            icon: const Icon(Icons.menu),
            color: Colors.black,
            iconSize: 25,
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              sBoxH30,
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(profileImage),
              ),
              Text(
                '$publicFirstName $publicLastName',
                style: f30C3TextStyle,
                textAlign: TextAlign.center,
              ),
              sBoxH30,
              MaterialWidget(
                materialChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      RowProfileInformationWidget(
                        title: 'Email :',
                        value: publicEmail,
                      ),
                      RowProfileInformationWidget(
                        title: 'Number :',
                        value: publicPhoneNumber,
                      ),
                      RowProfileInformationWidget(
                        title: 'Member since: ',
                        value: publicMemberSince,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: const FloatingActionButtonWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const MyBottonNavigationAppBar(
          whereIAmRightNow: WhereIAmRightNow.profile,
        ),
      ),
    );
  }
}
