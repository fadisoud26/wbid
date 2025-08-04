import 'package:wbid/constents/icon_constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/screens/homeScreens/home_screen.dart';
import 'package:wbid/screens/homeScreens/my_auctions_screen.dart';
import 'package:wbid/screens/homeScreens/profile_screen.dart';
import 'package:wbid/screens/homeScreens/selling_screen.dart';
import 'package:wbid/screens/homeScreens/wallet_screen.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, SellingScreen.id);
      },
      child: addIcon,
      backgroundColor: myColor3,
    );
  }
}

//---------------------------------------------------------------------------

class MyBottonNavigationAppBar extends StatefulWidget {
  const MyBottonNavigationAppBar({
    Key? key,
    this.whereIAmRightNow,
  }) : super(key: key);

  final WhereIAmRightNow? whereIAmRightNow;

  static void goFromNavigationAppBarToMyAuctionNotify(context) {
    Navigator.pushReplacementNamed(context, MyAuctionsScreen.id);
  }

  @override
  State<MyBottonNavigationAppBar> createState() =>
      _MyBottonNavigationAppBarState();
}

class _MyBottonNavigationAppBarState extends State<MyBottonNavigationAppBar> {
  void _onTapHome() {
    if (widget.whereIAmRightNow != WhereIAmRightNow.home) {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    }
  }

  void _onTapWallet() {
    if (widget.whereIAmRightNow != WhereIAmRightNow.wallet) {
      Navigator.pushReplacementNamed(context, WalletScreen.id);
    }
  }

  void _onTapMyAuction(context) {
    if (widget.whereIAmRightNow != WhereIAmRightNow.myAuctions) {
      ApiData.payout(userName: publicUserName.toString());
      ApiData.paymentWithNotify(
          userName: publicUserName.toString(), context: context);
    }
  }

  void _onTapProfile() {
    if (widget.whereIAmRightNow != WhereIAmRightNow.profile) {
      Navigator.pushReplacementNamed(context, ProfileScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: myColor2,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: (widget.whereIAmRightNow == WhereIAmRightNow.home)
                          ? myColor1
                          : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      _onTapHome();
                    },
                  ),
                  Text(
                    'Home',
                    style: (widget.whereIAmRightNow == WhereIAmRightNow.home)
                        ? f12BlackTextStyle
                        : f12WhiteTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.business_center,
                      color:
                          (widget.whereIAmRightNow == WhereIAmRightNow.wallet)
                              ? myColor1
                              : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      _onTapWallet();
                    },
                  ),
                  Text(
                    'wallet',
                    style: (widget.whereIAmRightNow == WhereIAmRightNow.wallet)
                        ? f12BlackTextStyle
                        : f12WhiteTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.gavel_rounded,
                      color: (widget.whereIAmRightNow ==
                              WhereIAmRightNow.myAuctions)
                          ? myColor1
                          : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      _onTapMyAuction(context);
                    },
                  ),
                  Text(
                    'My Actions',
                    style:
                        (widget.whereIAmRightNow == WhereIAmRightNow.myAuctions)
                            ? f12BlackTextStyle
                            : f12WhiteTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      color:
                          (widget.whereIAmRightNow == WhereIAmRightNow.profile)
                              ? myColor1
                              : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      _onTapProfile();
                    },
                  ),
                  Text(
                    'Profile',
                    style: (widget.whereIAmRightNow == WhereIAmRightNow.profile)
                        ? f12BlackTextStyle
                        : f12WhiteTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
