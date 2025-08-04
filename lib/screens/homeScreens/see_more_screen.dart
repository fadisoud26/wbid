import 'dart:async';
import 'package:intl/intl.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/screens/homeScreens/bid_now_screen.dart';
import 'package:wbid/widgets/loading_widget.dart';
import 'package:wbid/widgets/single_column_information_of_product_widget.dart';
import 'package:wbid/widgets/image_widget.dart';
import 'package:wbid/widgets/material_button_widget.dart';
import 'package:wbid/widgets/material_widget.dart';
import 'package:wbid/widgets/row_with_icon_information_widget.dart';
import 'package:wbid/widgets/timer_widget.dart';
import 'package:flutter/material.dart';

class SeeMoreScreen extends StatefulWidget {
  const SeeMoreScreen(
      {Key? key,
      this.nameOfProduct,
      this.brand,
      this.yearModel,
      this.price,
      this.fNameSeller,
      this.lNameSeller,
      this.endTime,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.image6,})
      : super(key: key);
  final String? nameOfProduct;
  final String? brand;
  final String? yearModel;
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

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(
        const Duration(seconds: 2),
        (Timer t) => {
              setState(() {
                ApiData.seeMore(nameOfProduct: widget.nameOfProduct!);
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
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
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          iconSize: 25,
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sBoxH20,
           ImageWidget(
            imageBase641: widget.image1,
            imageBase642: widget.image2,
            imageBase643: widget.image3,
            imageBase644: widget.image4,
            imageBase645: widget.image5,
            imageBase646: widget.image6,
            height: 200,
          ),
          MaterialButtonWidget(
            title: 'Bid Now',
            heigh: 50,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BidNowScreen(
                            nameOfProduct: widget.nameOfProduct,
                            price: widget.price,
                            fNameSeller: widget.fNameSeller,
                            lNameSeller: widget.lNameSeller,
                            endTime: widget.endTime,
                            image1:widget.image1,
                  image2: widget.image2,
                  image3: widget.image3,
                  image4: widget.image4,
                  image5: widget.image5,
                  image6: widget.image6,
                          )));
            },
          ),
          SeeMoreFirstWidget(
              nameOfProduct: widget.nameOfProduct,
              brand: widget.brand,
              yearModel: widget.yearModel,
              price: widget.price),
          Expanded(
            child: ApiData.singleProductInfoAsMap!['topBidValue'] == null
                ? const LoadingWidget()
                : RefreshIndicator(
                    onRefresh: () =>
                        ApiData.seeMore(nameOfProduct: widget.nameOfProduct!),
                    child: ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return MaterialWidget(
                            materialChild: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TimerWidget(
                                  endDateTime: DateFormat("yyyy-MM-dd hh:mm:ss")
                                      .parse(widget.endTime ??
                                          '2022-11-11 11:11:11'),
                                ),
                                RowWithIconInformation(
                                  icon: Icons.arrow_upward_rounded,
                                  title: 'top bid value:',
                                  value:
                                      '${ApiData.singleProductInfoAsMap!['topBidValue']} \$',
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
                          );
                        }),
                  ),
          ),
        ],
      )),
    );
  }
}

class SeeMoreFirstWidget extends StatelessWidget {
  const SeeMoreFirstWidget(
      {Key? key,
      String? nameOfProduct,
      String? brand,
      String? yearModel,
      String? price})
      : _nameOfProduct = nameOfProduct,
        _brand = brand,
        _yearModel = yearModel,
        _price = price,
        super(key: key);

  final String? _nameOfProduct;
  final String? _brand;
  final String? _yearModel;
  final String? _price;

  @override
  Widget build(BuildContext context) {
    return MaterialWidget(
      materialChild: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sBoxH10,
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SingleColumnInformationOfProduct(
                  title: 'Name',
                  value: _nameOfProduct,
                ),
                SingleColumnInformationOfProduct(
                  title: 'Brand',
                  value: _brand,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SingleColumnInformationOfProduct(
                  title: 'Year Model',
                  value: _yearModel,
                ),
                SingleColumnInformationOfProduct(
                  title: 'Price',
                  value: '$_price \$',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
