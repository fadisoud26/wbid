import 'dart:async';
import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/constents/validation_constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/screens/homeScreens/home_screen.dart';
import 'package:wbid/screens/logInScreens/log_in_screen.dart';
import 'package:wbid/widgets/material_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wbid/constents/constents.dart';

class ConfirmeScreen extends StatefulWidget {
  const ConfirmeScreen({Key? key}) : super(key: key);

  //This string variable is the identity of the page
  //we use it in routes attribute of MaterialApp widget in main file
  //id can help us to Page Navigation
  static const String id = 'confirme_screen';
  static void signUpConfirmeNotify(context) {
    Navigator.pushReplacementNamed(context, HomeScreen.id);
  }

  static void forgetPassConfirmeNotify(context) {
    Navigator.pushReplacementNamed(context, LogInScreen.id);
  }

  @override
  State<ConfirmeScreen> createState() => _ConfirmeState();
}

class _ConfirmeState extends State<ConfirmeScreen> {
  //^^^^^^^^^^^^^^^^^^^^^^^^^start variables section^^^^^^^^^^^^^^^^^^^^^^^^^^^

  // _formKey is a private varriabe and we use it in key attribute of Form widget
  // We can apply some functions to it
  final _formKey = GlobalKey<FormState>();

  // the TextEditingController Contains input values ​​from textFiledWidget
  final _confirmeFieldController = TextEditingController();

  String? _email, _userName, _id;
  int? _seconds;

  Timer? _timer; // _timer is a private objedt frome Timer class

  //------------------------end variable section-----------------------------

  //^^^^^^^^^^^^^^^^^^^^^^^^start function section^^^^^^^^^^^^^^^^^^^^^^^^^^^

  //we use this function to verify the validity of the data entered by the user
  //if data not correct return false else save data and return true
  bool _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return false;
    _formKey.currentState!.save();
    return true;
  }

  //we use this function to creat countDown
  void _startTimer() {
    _seconds = 60;
    if (_timer != null) _timer!.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        (_seconds! < 1) ? timer.cancel() : _seconds! - 1;
      });
    });
  }

  //---------------------------end function section --------------------------------

  @override
  void initState() {
    _startTimer(); // start the countDown befor build the page
    super.initState();
  }

  @override
  void dispose() {
    //We use .dispose to reformat the TextEditingController and empty their values ​​when the page is finished
    _confirmeFieldController.dispose();

    //we use timer.cansel to stop the countDown when the page is finished
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_previousScreenArg is a Map have keys and values from the previous page
    final _previousScreenArg = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    //save in _email the value that has emilController key
    _email = _previousScreenArg['emailController'];
    _userName = _previousScreenArg['userNameController'];

    //save in _id the value that has id key
    // we can know the previous page by id key
    _id = _previousScreenArg['id'];

    //we use this function to now the previous page and which api we will use
    //if the previous page is signup so use signUpConfirme API
    //if the previous page is forgetPassword so use forgetPasswordConfirme API
    void _onTap() {
      if (_id == 'sign_up_screen') {
        if (_saveForm()) {
          ApiData.signupConfirme(
              userName: _userName!,
              code: _confirmeFieldController.text,
              context: context);
        }
      } else if (_id == 'forgot_screen') {
        if (_saveForm()) {
          ApiData.forgetpassConfirme(
              email: _email!,
              code: _confirmeFieldController.text,
              context: context);
        }
      }
    }

    /*
      titleAppBar, sendMessageToPhoneText and enterCodeText :
        are defined in a text_constents.dart file and it is a Text widgets
      sBoxH30 , sBoxH20 ,... :
        are defined in a constents.dart file and it is a sizeBox widget
     */

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: appBarTextInloginAndSignup,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 25,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        //the body only have a column
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /*the column have a : 
                some text, 
                form widget,
                some text*/

              sBoxH30,
              sendMessageToPhoneText,
              sBoxH10,
              enterCodeText,
              sBoxH20,

              //this form have a PimCodeTextFiled and one button
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        controller: _confirmeFieldController,
                        keyboardType: TextInputType.number,
                        length: 6,
                        errorTextSpace: 30,
                        animationType: AnimationType.fade,
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.white,
                        appContext: context,
                        onChanged: (value) {},
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          inactiveColor: Colors.black,
                          activeColor: myColor3,
                          selectedColor: Colors.black,
                        ),
                        cursorColor: myColor3,
                        validator: (value) {
                          //validator: to ensure that data entered by user according to a specific format
                          //pinCodeTextFieldValidator defined in validation_constents.dart file*/
                          return pinCodeTextFieldValidator(value);
                        },
                      ),
                    ),

                    //MaterialButtonWidget defined in button_widget.dart file
                    //it is a button have title and function on tap it
                    MaterialButtonWidget(
                      onTap: () {
                        _onTap();
                      },
                      title: 'Confirme',
                    ),
                  ],
                ),
              ),
              sBoxH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _startTimer();
                    },
                    child: resendText,
                  ),
                  Text(
                    ' after 0:$_seconds s',
                    style: f14BlackTextStyle,
                  ),
                ],
              ),
              sBoxH20,
            ],
          ),
        ),
      ),
    );
  }
}
