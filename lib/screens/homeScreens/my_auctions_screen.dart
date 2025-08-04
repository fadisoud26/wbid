import 'dart:async';
import 'dart:convert';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/widgets/drawer_widget.dart';
import 'package:wbid/widgets/loading_widget.dart';
import 'package:wbid/widgets/material_widget.dart';
import 'package:wbid/widgets/my_botton_navigation_app_bar.dart';
import 'package:wbid/widgets/row_with_icon_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:wbid/widgets/row_with_text_button_widget.dart';

class MyAuctionsScreen extends StatefulWidget {
  const MyAuctionsScreen({Key? key}) : super(key: key);
  static const String id = 'my_auctions_screen';

  @override
  State<MyAuctionsScreen> createState() => _MyAuctionsScreenState();
}

class _MyAuctionsScreenState extends State<MyAuctionsScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  final ScrollController _scrollController = ScrollController();
  int _whoIsPassed = 1;
  int _deco = 1;
  Timer? _timer;

  String? _nameOfProduct = '',
      _price = '',
      _date = '',
      _fname = '',
      _lname = '';
  dynamic _image1;

  Widget _check() {
    if (_whoIsPassed == 1) {
      ApiData.payment(userName: publicUserName.toString());
      return _listViewInMyActionScreen('Seller', ApiData.dataLenOfPayment ?? 0);
    } else {
      ApiData.payout(userName: publicUserName.toString());
      return _listViewInMyActionScreen('Buyer', ApiData.dataLenOfPayout ?? 0);
    }
  }

  ListView _listViewInMyActionScreen(String title, int length) {
    return ListView.builder(
      itemCount: length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (title == 'Seller') {
          (ApiData.paymentAsMap != null)
              ? _nameOfProduct = ApiData.paymentAsMap!['data'][index]['Name']
              : '8';
          (ApiData.paymentAsMap != null)
              ? _price = ApiData.paymentAsMap!['data'][index]['price']
              : '8';
          (ApiData.paymentAsMap != null)
              ? _date = ApiData.paymentAsMap!['data'][index]['Date']
              : "8";
          (ApiData.paymentAsMap != null)
              ? _fname = ApiData.paymentAsMap!['data'][index]['sellerfirstname']
              : '9';
          (ApiData.paymentAsMap != null)
              ? _lname = ApiData.paymentAsMap!['data'][index]['sellerlastname']
              : '9';
          (ApiData.paymentAsMap != null)
              ? _image1 =
                  base64Decode(ApiData.paymentAsMap!['data'][index]['image1'])
              : backgroundimage;
        } else {
          (ApiData.payoutAsMap != null)
              ? _nameOfProduct = ApiData.payoutAsMap!['data'][index]['Name']
              : '9';
          (ApiData.payoutAsMap != null)
              ? _price = ApiData.payoutAsMap!['data'][index]['price']
              : '9';
          (ApiData.payoutAsMap != null)
              ? _date = ApiData.payoutAsMap!['data'][index]['Date']
              : '9';
          (ApiData.payoutAsMap != null)
              ? _fname = ApiData.payoutAsMap!['data'][index]['buyerfirstname']
              : '9';
          (ApiData.payoutAsMap != null)
              ? _lname = ApiData.payoutAsMap!['data'][index]['buyerlastname']
              : '9';

          (ApiData.paymentAsMap != null)
              ? _image1 =
                  base64Decode(ApiData.paymentAsMap!['data'][index]['image1'])
              : backgroundimage;
        }

        return MaterialWidget(
          materialChild: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    flex: 8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: (_image1 == backgroundimage)
                            ? Image.asset(_image1)
                            : Image.memory(_image1))),
                Expanded(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: $_nameOfProduct',
                          style: f18BlackTextStyle,
                        ),
                        Text(
                          'Price: $_price',
                          style: f18BlackTextStyle,
                        ),
                        Text(
                          'Date: $_date',
                          style: f18BlackTextStyle,
                        ),
                        RowWithIconAndAvatarCircleInformation(
                          icon: Icons.person,
                          title: title,
                          img: const AssetImage(sellerAndBuyerImage),
                          fName: _fname,
                          lName: _lname,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _timer = Timer.periodic(
        const Duration(seconds: 10),
        (Timer t) => {
              setState(() {
                ApiData.payout(userName: publicUserName.toString());
                ApiData.payment(userName: publicUserName.toString());
              })
            });
    ApiData.payout(userName: publicUserName.toString());
    ApiData.payment(userName: publicUserName.toString());
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
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
          title: appBarTextInMyActionsScreen,
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
              RowWith2TextButtonWidget(
                decorationFor: _deco,
                leftHintText: 'Payment',
                rightHintTtext: 'Payout',
                leftOnPassed: () {
                  setState(() {
                    _whoIsPassed = 1;
                    _deco = 1;
                  });
                },
                rightOnPassed: () {
                  setState(() {
                    _whoIsPassed = 2;
                    _deco = 2;
                  });
                },
              ),
              lastTransactionText,
              Expanded(
                child: (ApiData.paymentAsMap == null)
                    ? const LoadingWidget()
                    : _check(),
              ),
            ],
          ),
        ),
        floatingActionButton: const FloatingActionButtonWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const MyBottonNavigationAppBar(
          whereIAmRightNow: WhereIAmRightNow.myAuctions,
        ),
      ),
    );
  }
}
