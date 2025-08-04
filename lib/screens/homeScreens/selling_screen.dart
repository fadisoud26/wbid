import 'dart:convert';
import 'dart:io';
//import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/icon_constents.dart';
import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/function/function.dart';
import 'package:wbid/screens/homeScreens/home_screen.dart';
import 'package:wbid/widgets/material_button_widget.dart';
import 'package:wbid/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellingScreen extends StatefulWidget {
  const SellingScreen({Key? key}) : super(key: key);
  static const String id = 'selling_screen';

  static void sellingNotify(context) {
    Navigator.pushReplacementNamed(context, HomeScreen.id);
  }

  @override
  State<SellingScreen> createState() => _SellingScreenState();
}

class _SellingScreenState extends State<SellingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameOfProductController = TextEditingController();
  final _brandFieldController = TextEditingController();
  final _yearModelFieldController = TextEditingController();
  final _minimumBidPriceController = TextEditingController();
  final _textFieldController = TextEditingController();
  final _startDateTimeController = TextEditingController();
  final _endDateController = TextEditingController();
  final _endTimeController = TextEditingController();
  String? _endDateTime;

  List<File>? _images = [];
  String? _imageAsBase641;
  String? _imageAsBase642;
  String? _imageAsBase643;
  String? _imageAsBase644;
  String? _imageAsBase645;
  String? _imageAsBase646;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        _images!.add(imageTemporary);
      });
    } on PlatformException catch (e) {
      print('failed to pick image $e');
    }
  }

  bool _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return false;
    _formKey.currentState!.save();
    return true;
  }

  bool convertImage() {
    if (_images!.length < 6) {
      snackBar('You most input 6 image or more!', context);
      return false;
    } else {
      _addEndTimeToEndDate();
      _imageAsBase641 = base64Encode(_images![0].readAsBytesSync());
      _imageAsBase642 = base64Encode(_images![1].readAsBytesSync());
      _imageAsBase643 = base64Encode(_images![2].readAsBytesSync());
      _imageAsBase644 = base64Encode(_images![3].readAsBytesSync());
      _imageAsBase645 = base64Encode(_images![4].readAsBytesSync());
      _imageAsBase646 = base64Encode(_images![5].readAsBytesSync());
      return true;
    }
  }

  void _addEndTimeToEndDate() {
    _endDateTime = '${_endDateController.text} ${_endTimeController.text}';
  }

  void _sellingApi() {
    ApiData.selling(
        userName: publicUserName.toString(),
        nameOfProduct: _nameOfProductController.text,
        brand: _brandFieldController.text,
        yearModel: _yearModelFieldController.text,
        price: _minimumBidPriceController.text,
        startdate: _startDateTimeController.text,
        enddate: _endDateTime.toString(),
        firstImage: _imageAsBase641.toString(),
        secondImage: _imageAsBase642.toString(),
        thirdImage: _imageAsBase643.toString(),
        fourthImage: _imageAsBase644.toString(),
        fifthImage: _imageAsBase645.toString(),
        sixthImage: _imageAsBase646.toString(),
        context: context);
  }

  @override
  void initState() {
    super.initState();
    _startDateTimeController.text = '';
    _endDateController.text = '';
    _endTimeController.text = '';
  }

  @override
  void dispose() {
    _nameOfProductController.dispose();
    _brandFieldController.dispose();
    _yearModelFieldController.dispose();
    _minimumBidPriceController.dispose();
    _textFieldController.dispose();
    _startDateTimeController.dispose();
    _endDateController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        elevation: 0,
        backgroundColor: Colors.white,
        title: sellingText,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, HomeScreen.id);
          },
          icon: const Icon(Icons.cancel),
          color: Colors.black,
          iconSize: 25,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    productInformationText,
                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.text,
                      textFieldController: _nameOfProductController,
                      hintText: 'Product name',
                    ),
                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.text,
                      textFieldController: _brandFieldController,
                      hintText: 'Brand',
                    ),
                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.text,
                      textFieldController: _yearModelFieldController,
                      hintText: 'Year Model',
                    ),
                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.text,
                      textFieldController: _minimumBidPriceController,
                      hintText: 'Minimum bid price',
                    ),
                    addPhotoText,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            pickImage(ImageSource.camera);
                          },
                          icon: photoCameraIcon,
                        ),
                        IconButton(
                          onPressed: () {
                            pickImage(ImageSource.gallery);
                          },
                          icon: photoIcon,
                        ),
                      ],
                    ),
                    sBoxH20,
                    biddingInformationText,
                    Row(
                      children: [
                        Expanded(
                          child: DataTimeTextFieldWidget(
                            labelText: 'Start Date',
                            textFieldController: _startDateTimeController,
                            timeOrDate: TimeOrDate.date,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DataTimeTextFieldWidget(
                            labelText: 'End Date',
                            textFieldController: _endDateController,
                            timeOrDate: TimeOrDate.date,
                          ),
                        ),
                        Expanded(
                          child: DataTimeTextFieldWidget(
                            labelText: 'End Time',
                            textFieldController: _endTimeController,
                            timeOrDate: TimeOrDate.time,
                          ),
                        ),
                      ],
                    ),
                    MaterialButtonWidget(
                      title: 'Sell',
                      onTap: () {
                        if (_saveForm() && convertImage()) {
                          _sellingApi();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
