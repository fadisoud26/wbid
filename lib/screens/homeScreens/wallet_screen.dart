import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/widgets/drawer_widget.dart';
import 'package:wbid/widgets/material_button_widget.dart';
import 'package:wbid/widgets/first_row_in_wallet_screen.dart';
import 'package:wbid/widgets/my_botton_navigation_app_bar.dart';
import 'package:wbid/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  static const String id = 'wallet_screen';

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  final _textFieldController = TextEditingController();
  
  void _fillWalletAlert() {
    Alert(
        style: const AlertStyle(
          isButtonVisible: false,
          buttonAreaPadding: EdgeInsets.all(0),
        ),
        context: context,
        title: 'How much is it ?',
        content: Column(
          children: [
            NormalTextFieldWidget(
              tNameField: TypeNameOfField.text,
              textFieldController: _textFieldController,
              hintText: 'How much you want?',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButtonWidget(
                  title: 'Okay',
                  minWidth: 100,
                  backgroundColor: myColor3,
                  heigh: 50,
                  onTap: () {},
                ),
                MaterialButtonWidget(
                  title: 'Cancel',
                  minWidth: 100,
                  backgroundColor: myGreyColor,
                  heigh: 50,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        )).show();
  }


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
          title: appBarTextInWalletScreen,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FirstRowInWalletScreen(
                currentWalletBalance: publicAmount,
                availableBalanceInBankAccount: publicAmount,
              ),
              MaterialButtonWidget(
                title: 'Filling Wallet',
                heigh: 50,
                onTap: () {
                  _fillWalletAlert();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: const FloatingActionButtonWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const MyBottonNavigationAppBar(
          whereIAmRightNow: WhereIAmRightNow.wallet,
        ),
      ),
    );
  }
}
