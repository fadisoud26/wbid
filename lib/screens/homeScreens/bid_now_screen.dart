import 'dart:async';
import 'package:intl/intl.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/icon_constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/widgets/loading_widget.dart';
import 'package:wbid/widgets/material_button_widget.dart';
import 'package:wbid/widgets/image_widget.dart';
import 'package:wbid/widgets/material_widget.dart';
import 'package:wbid/widgets/row_with_icon_information_widget.dart';
import 'package:wbid/widgets/timer_widget.dart';
import 'package:flutter/material.dart';

class BidNowScreen extends StatefulWidget {
  const BidNowScreen(
      {Key? key,
      this.nameOfProduct,
      this.price,
      this.fNameSeller,
      this.lNameSeller,
      this.endTime,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.image6,
      })
      : super(key: key);
  final String? nameOfProduct;
  final String? price;
  final String? fNameSeller;
  final String? lNameSeller;
  final String? endTime;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? image5;
  final String? image6;

  static String? offerName2,
      price2,
      endTime2,
      sellerFirstName2,
      sellerLastName2,
      image102,
      image202,
      image302,
      image402,
      image502,
      image602;

  static void set(
      {String? offername1,
      String? price1,
      String? endtime1,
      String? sellerFName1,
      String? sellerLName1,
      String? image101,
      String? image201,
      String? image301,
      String? image401,
      String? image501,
      String? image601,}) {
    offerName2 = offername1;
    price2 = price1;
    endTime2 = endtime1;
    sellerFirstName2 = sellerFName1;
    sellerLastName2 = sellerLName1;
    image102 = image101;
    image202 = image201;
    image302 = image301;
    image402 = image401;
    image502 = image501;
    image602 = image601;
  }

  static void bidNowNotify(context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BidNowScreen(
                  nameOfProduct: offerName2,
                  price: price2,
                  fNameSeller: sellerFirstName2,
                  lNameSeller: sellerLastName2,
                  endTime: endTime2,
                  image1: image102,
                  image2: image202,
                  image3: image302,
                  image4: image402,
                  image5: image502,
                  image6: image602,
                )));
  }

  @override
  State<BidNowScreen> createState() => _BidNowScreenState();
}

class _BidNowScreenState extends State<BidNowScreen> {
  Timer? _timer;
  final int _minimumBidding = 10;
  int? _topBidValue = 0;
  int? _myBid = 10;
  void _subAction() {
    setState(() {
      if (_myBid! > (_minimumBidding + _topBidValue!)) {
        _myBid = _myBid! - _minimumBidding;
      }
    });
  }

  void _addAction() {
    setState(() {
      _myBid = _myBid! + _minimumBidding;
    });
  }

  void _addbid() {
    ApiData.bidNow(
        nameOfProduct: widget.nameOfProduct!,
        userName: publicUserName!,
        amount: _myBid.toString(),
        context: context);
  }

  @override
  void initState() {
    _timer = Timer.periodic(
        const Duration(seconds: 2),
        (Timer t) => {
              setState(() {
                ApiData.seeMore(nameOfProduct: widget.nameOfProduct ?? '');
              })
            });
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String topBidValueAsString =
        ApiData.singleProductInfoAsMap!['topBidValue'] ?? '0';

    _topBidValue = int.parse(topBidValueAsString);

    if (_myBid! < _topBidValue! + 10) _myBid = 10 + _topBidValue!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.nameOfProduct ?? '',
          style: f30C3TextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.cancel),
          color: Colors.black,
          iconSize: 25,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             ImageWidget(
              imageBase641: widget.image1,
              imageBase642: widget.image2,
              imageBase643: widget.image3,
              imageBase644: widget.image4,
              imageBase645: widget.image5,
              imageBase646: widget.image6,
              height: 230,
            ),
            TimerWidget(
              endDateTime: DateFormat("yyyy-MM-dd hh:mm:ss")
                  .parse(widget.endTime ?? '2022-11-11 11:11:11'),
            ),
            sBoxH10,
            Expanded(
              child: RefreshIndicator(
                onRefresh: () =>
                    ApiData.seeMore(nameOfProduct: widget.nameOfProduct!),
                child: _topBidValue == null || _topBidValue == 0
                    ? const LoadingWidget()
                    : ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          MaterialWidget(
                            materialChild: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                sBoxH10,
                                RowWithIconInformation(
                                  icon: Icons.arrow_upward_rounded,
                                  title: 'top bid value:',
                                  value: _topBidValue.toString(),
                                ),
                                RowWithIconInformation(
                                  icon: Icons.arrow_downward_rounded,
                                  title: 'minimum bidding:',
                                  value: _minimumBidding.toString(),
                                ),
                                MaterialWidget(
                                  materialChild: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          _subAction();
                                        },
                                        icon: subIcon,
                                      ),
                                      Text(
                                        _myBid.toString(),
                                        style: f18BlackTextStyle,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _addAction();
                                        },
                                        icon: addIcon,
                                      ),
                                    ],
                                  ),
                                ),
                                MaterialButtonWidget(
                                  title: 'Add your bid',
                                  heigh: 50,
                                  onTap: () {
                                    setState(() {
                                      BidNowScreen.set(
                                          offername1: widget.nameOfProduct,
                                          price1: widget.price,
                                          endtime1: widget.endTime,
                                          sellerFName1: widget.fNameSeller,
                                          sellerLName1: widget.lNameSeller,
                                          image101: widget.image1,
                                          image201: widget.image2,
                                          image301: widget.image3,
                                          image401: widget.image4,
                                          image501: widget.image5,
                                          image601: widget.image6,
                                          );
                                      _addbid();
                                    });
                                  },
                                ),
                                RowWithIconInformation(
                                  icon: Icons.emoji_flags_rounded,
                                  title: 'the auction starts at:',
                                  value: widget.price.toString(),
                                ),
                                RowWithIconInformation(
                                  icon: Icons.people,
                                  title: 'number of participants:',
                                  value: ApiData.singleProductInfoAsMap![
                                          'numberOfParticipants']
                                      .toString(),
                                ),
                                RowWithIconInformation(
                                  icon: Icons.gavel_rounded,
                                  title: 'number of bidding:',
                                  value: ApiData
                                      .singleProductInfoAsMap!['numberOfBiding']
                                      .toString(),
                                ),
                                RowWithIconAndAvatarCircleInformation(
                                  icon: Icons.person,
                                  title: 'seller profile:',
                                  img: const AssetImage(sellerAndBuyerImage),
                                  fName: widget.fNameSeller,
                                  lName: widget.lNameSeller,
                                ),
                              ],
                            ),
                          ),
                          sBoxH20,
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
