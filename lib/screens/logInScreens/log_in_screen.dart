import 'package:shared_preferences/shared_preferences.dart';
import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/constents/validation_constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/screens/homeScreens/home_screen.dart';
import 'package:wbid/screens/logInScreens/forgot_password_screen.dart';
import 'package:wbid/widgets/material_button_widget.dart';
import 'package:wbid/widgets/row_with_text_button_widget.dart';
import 'package:wbid/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';
import 'sign_up_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  //This string variable is the identity of the page
  //we use it in routes attribute of MaterialApp widget in main file
  //id can help us to Page Navigation
  static const String id = 'log_in_screen';
  static void loginNotify(context) {
    Navigator.pushReplacementNamed(context, HomeScreen.id);
  }

  @override
  State<LogInScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LogInScreen> {
  //^^^^^^^^^^^^^^^^^^^^^^^^^start variables section^^^^^^^^^^^^^^^^^^^^^^^^^^^

  // _formKey is a private varriabe and we use it in key attribute of Form widget
  // We can apply some functions to it
  final _formKey = GlobalKey<FormState>();

  // the TextEditingController Contains input values ​​from textFiledWidget
  final _userNameFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

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

  void _onTap() {
    ApiData.homeScreenApi();
    if (_saveForm()) {
      ApiData.login(
          userName: _userNameFieldController.text,
          passWord: _passwordFieldController.text,
          context: context);
    }
  }

  //We use this function to find out if the user is already registered in the application or not
  //Only if it is registered, move it to the home page
  _getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userName = preferences.getString('username');
    var pass = preferences.getString('password');
    ApiData.homeScreenApi();
    if (userName != null && pass != null) {
      ApiData.login(
          userName: userName.toString(),
          passWord: pass.toString(),
          context: context);
    }
  }

  /*We use this function to fetch data from backend 
    api_data.login() defined in api_data.dart file as static feuter
    we send the user name and password and if the order done : 
        1 - we save the user data that coming back frome database in _user object
        2 - we save it in cash memory
        3 - move us to home page*/

  //---------------------------end function section --------------------------------

  @override
  void initState() {
    // We call this function here to make sure that it is registered or not before building the page
    _getPref();
    super.initState();
  }

  @override
  void dispose() {
    //We use .dispose to reformat the TextEditingController and empty their values ​​when the page is finished
    _userNameFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // To calculate the screen height and width of the device using the application
    //These variables are defined in a constents.dart file
    //to be used in all pages of the application to be global
    heightOfScreen = MediaQuery.of(context).size.height;
    widthOfScreen = MediaQuery.of(context).size.width;

    //Take 8.5 percent of the screen height to determine the height of the app bar
    appBarHeight = (heightOfScreen! / 8.5);

    /*
      titleAppBar, welcomeText, welcomeContentText, loginText and forgotPasswordTextCRed :
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
      ),
      body: SafeArea(
        //the body only have a column
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            /*the column have a : 
                some text,
                row widget have two text buttom, 
                form widget,
                some text ,
                text buttom,*/

            children: [
              sBoxH30,
              welcomeText,
              welcomeContentText,
              sBoxH20,

              /*this widget defined in row_widget.dart file
                it have two text button :
                  the left text button is : "LogIn" , we can change it by leftHintText attribut
                  and right text button is : "SignUp" , we can change it by rightHintText attribut
                if decoration = 1  : Activate the SignUp button
                if decoration = 2  : Activate the LogIn button*/
              RowWith2TextButtonWidget(
                decorationFor: 1, // activate the signUp button
                rightOnPassed: () {
                  //on click on SignUp text move us to SingUp page
                  Navigator.pushReplacementNamed(context, SignUpScreen.id);
                },
              ),
              sBoxH20,

              //this form have a two textFiled and one button
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /*it is defined in text_field_widget.dart file
                      1 - tNameFild: to know how we design it
                      2 - textFieldController: to take the value entered by user
                      3 - validator: to ensure that data entered by user according to a specific format
                      textValidator and passwordValidator defined in validation_constents.dart file*/
                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.userName,
                      textFieldController: _userNameFieldController,
                      validator: (value) {
                        return textValidator(value);
                      },
                    ),
                    PasswordTextFieldWidget(
                      tNameField: TypeNameOfField.password,
                      textFieldController: _passwordFieldController,
                      validator: (value) {
                        return passwordValidator(value);
                      },
                    ),

                    //MaterialButtonWidget defined in button_widget.dart file
                    //it is a button have title and function on tap it
                    MaterialButtonWidget(
                      onTap: () {
                        _onTap();
                      },
                      title: logInText,
                    ),
                  ],
                ),
              ),
              dontHaveAnAccountText,
              TextButton(
                //button to move us to forget password page
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ForgotPasswordScreen.id);
                },
                child: forgotPasswordTextCRed,
              ),
              sBoxH20,
            ],
          ),
        ),
      ),
    );
  }
}
