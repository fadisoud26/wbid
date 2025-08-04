import 'dart:async';
import 'package:intl/intl.dart';
import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/screens/homeScreens/bid_now_screen.dart';
import 'package:wbid/screens/homeScreens/see_more_screen.dart';
import 'package:wbid/widgets/drawer_widget.dart';
import 'package:wbid/widgets/loading_widget.dart';
import 'package:wbid/widgets/material_button_widget.dart';
import 'package:wbid/widgets/image_widget.dart';
import 'package:wbid/widgets/material_widget.dart';
import 'package:wbid/widgets/my_botton_navigation_app_bar.dart';
import 'package:wbid/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'home_screen';
  static String? offerName,
      yearModel,
      brand,
      price,
      endTime,
      sellerFirstName,
      sellerLastName,
      image1,
      image2,
      image3,
      image4,
      image5,
      image6;

  static void set({
    String? offername,
    String? year,
    String? brand,
    String? price,
    String? endtime,
    String? sellerFName,
    String? sellerLName,
    String? img1,
    String? img2,
    String? img3,
    String? img4,
    String? img5,
    String? img6,
  }) {
    offerName = offername;
    yearModel = year;
    brand = brand;
    price = price;
    endTime = endtime;
    sellerFirstName = sellerFName;
    sellerLastName = sellerLName;
    image1 = img1;
    image2 = img2;
    image3 = img3;
    image4 = img4;
    image5 = img5;
    image6 = img6;
  }

  static void seeMoreNotify(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SeeMoreScreen(
                  nameOfProduct: offerName,
                  brand: brand,
                  yearModel: yearModel,
                  price: price,
                  fNameSeller: sellerFirstName,
                  lNameSeller: sellerLastName,
                  endTime: endTime,
                  image1: image1,
                  image2: image2,
                  image3: image3,
                  image4: image4,
                  image5: image5,
                  image6: image6,
                )));
  }

  static void bidNowNotify(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BidNowScreen(
                  nameOfProduct: offerName,
                  price: price,
                  fNameSeller: sellerFirstName,
                  lNameSeller: sellerLastName,
                  endTime: endTime,
                  image1: image1,
                  image2: image2,
                  image3: image3,
                  image4: image4,
                  image5: image5,
                  image6: image6,
                )));
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(
        const Duration(seconds: 10),
        (Timer t) => {
              setState(() {
                ApiData.homeScreenApi();
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
    heightOfScreen = MediaQuery.of(context).size.height;
    widthOfScreen = MediaQuery.of(context).size.width;
    appBarHeight = (heightOfScreen! / 8.5);

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
          title: appBarTextInHomeScreens,
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
        body: ApiData.allProductsAsMap == null
            ? const LoadingWidget()
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    happeningNowText,
                    sBoxH20,
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => ApiData.homeScreenApi(),
                        child: ListView.builder(
                          itemCount: (ApiData.dataLenOfHome != null)
                              ? ApiData.dataLenOfHome
                              : 1,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            HomeScreen.offerName =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data']![index]
                                            ['offername']
                                        .toString()
                                    : ' ';
                            HomeScreen.yearModel =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                            ['year']
                                        .toString()
                                    : ' ';
                            HomeScreen.brand =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                            ['brand']
                                        .toString()
                                    : ' ';

                            HomeScreen.price = (ApiData.allProductsAsMap) !=
                                    null
                                ? double.parse(ApiData.allProductsAsMap!['data']
                                        [index]['initialprice'])
                                    .toStringAsFixed(2)
                                : ' ';

                            HomeScreen.endTime =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                            ['endDate']
                                        .toString()
                                    : '2022-9-6 10:3:3';

                            HomeScreen.sellerFirstName =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                            ['sellerfirstname']
                                        .toString()
                                    : ' ';
                            HomeScreen.sellerLastName =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                            ['sellerlastname']
                                        .toString()
                                    : ' ';
                            HomeScreen.image1 =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                        ['image1']
                                    : backgroundimage;

                            HomeScreen.image2 =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                        ['image2']
                                    : backgroundimage;

                            HomeScreen.image3 =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                        ['image3']
                                    : backgroundimage;

                            HomeScreen.image4 =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                        ['image4']
                                    : backgroundimage;

                            HomeScreen.image5 =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                        ['image5']
                                    : backgroundimage;

                            HomeScreen.image6 =
                                (ApiData.allProductsAsMap) != null
                                    ? ApiData.allProductsAsMap!['data'][index]
                                        ['image6']
                                    : backgroundimage;

                            return MaterialWidgetForHomeScreen(
                              offerName: HomeScreen.offerName,
                              yearModel: HomeScreen.yearModel,
                              brand: HomeScreen.brand,
                              price: HomeScreen.price,
                              endTime: HomeScreen.endTime,
                              sellerFirstName: HomeScreen.sellerFirstName,
                              sellerLastName: HomeScreen.sellerLastName,
                              image1: HomeScreen.image1,
                              image2: HomeScreen.image2,
                              image3: HomeScreen.image3,
                              image4: HomeScreen.image4,
                              image5: HomeScreen.image5,
                              image6: HomeScreen.image6,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton: const FloatingActionButtonWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const MyBottonNavigationAppBar(
          whereIAmRightNow: WhereIAmRightNow.home,
        ),
      ),
    );
  }
}

class MaterialWidgetForHomeScreen extends StatelessWidget {
  const MaterialWidgetForHomeScreen({
    Key? key,
    required String? offerName,
    required String? yearModel,
    required String? brand,
    required String? price,
    required String? endTime,
    required String? sellerFirstName,
    required String? sellerLastName,
    required String? image1,
    required String? image2,
    required String? image3,
    required String? image4,
    required String? image5,
    required String? image6,
  })  : _offerName = offerName,
        _yearModel = yearModel,
        _brand = brand,
        _price = price,
        _endTime = endTime,
        _sellerFirstName = sellerFirstName,
        _sellerLastName = sellerLastName,
        _image1 = image1,
        _image2 = image2,
        _image3 = image3,
        _image4 = image4,
        _image5 = image5,
        _image6 = image6,
        super(key: key);

  final String? _offerName;
  final String? _yearModel;
  final String? _brand;
  final String? _price;
  final String? _endTime;
  final String? _sellerFirstName;
  final String? _sellerLastName;
  final String? _image1;
  final String? _image2;
  final String? _image3;
  final String? _image4;
  final String? _image5;
  final String? _image6;

  @override
  Widget build(BuildContext context) {
    return MaterialWidget(
      materialChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sBoxH10,
          Container(
            child: ImageWidget(
              imageBase641: _image1,
              imageBase642: _image2,
              imageBase643: _image3,
              imageBase644: _image4,
              imageBase645: _image5,
              imageBase646: _image6,
              height: 200,
            ),
          ),
          sBoxH10,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              _offerName!,
              style: f20BlackTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '''year model : $_yearModel, brand: $_brand, price: $_price ''',
              style: f18GreyTextStyle,
            ),
          ),
          TimerWidget(
            endDateTime: DateFormat("yyyy-MM-dd hh:mm:ss").parse(_endTime!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButtonWidget(
                title: 'Bid now',
                minWidth: 130,
                heigh: 50,
                onTap: () {
                  HomeScreen.set(
                    offername: _offerName!,
                    year: _yearModel!,
                    brand: _brand!,
                    price: _price!,
                    endtime: _endTime!,
                    sellerFName: _sellerFirstName!,
                    sellerLName: _sellerLastName!,
                    img1: _image1,
                    img2: _image2,
                    img3: _image3,
                    img4: _image4,
                    img5: _image5,
                    img6: _image6,
                  );
                  ApiData.seeMoreWithNotify(
                      nameOfProduct: _offerName ?? '', context: context, i: 1);
                },
              ),
              MaterialButtonWidget(
                title: 'See more',
                minWidth: 130,
                backgroundColor: myGreyColor,
                heigh: 50,
                onTap: () {
                  HomeScreen.set(
                    offername: _offerName!,
                    year: _yearModel!,
                    brand: _brand!,
                    price: _price!,
                    endtime: _endTime!,
                    sellerFName: _sellerFirstName!,
                    sellerLName: _sellerLastName!,
                    img1: _image1,
                    img2: _image2,
                    img3: _image3,
                    img4: _image4,
                    img5: _image5,
                    img6: _image6,
                  );
                  ApiData.seeMoreWithNotify(
                      nameOfProduct: _offerName ?? '', context: context, i: 0);
                },
              ),
            ],
          ),
          sBoxH10,
        ],
      ),
    );
  }
}
