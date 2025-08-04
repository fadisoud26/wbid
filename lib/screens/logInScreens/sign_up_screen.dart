import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/constents/validation_constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/screens/logInScreens/confirme_screen.dart';
import 'package:wbid/screens/logInScreens/log_in_screen.dart';
import 'package:wbid/widgets/material_button_widget.dart';
import 'package:wbid/widgets/row_with_text_button_widget.dart';
import 'package:wbid/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  //This string variable is the identity of the page
  //we use it in routes attribute of MaterialApp widget in main file
  //id can help us to Page Navigation
  static const String id = 'sign_up_screen';
  static String? email, userName;

  static void set({String? mail, String? username}) {
    email = mail;
    userName = username;
  }

  static void signUpNotify(context) {
    Navigator.pushNamed(
      context,
      ConfirmeScreen.id,
      arguments: {
        'id': 'sign_up_screen',
        'emailController': email,
        'userNameController': userName,
      },
    );
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //^^^^^^^^^^^^^^^^^^^^^^^^^start variables section^^^^^^^^^^^^^^^^^^^^^^^^^^^

  // _formKey is a private varriabe and we use it in key attribute of Form widget
  // We can apply some functions to it
  final _formKey = GlobalKey<FormState>();

  // the TextEditingController Contains input values ​​from textFiledWidget
  final _phoneNumberFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _bankAccountFieldController = TextEditingController();
  final _passwordBankAccountFieldController = TextEditingController();
  final _userNameFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _firstNameFieldController = TextEditingController();
  final _secondNameFieldController = TextEditingController();

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
    if (_saveForm()) {
      SignUpScreen.set(
          mail: _emailFieldController.text,
          username: _userNameFieldController.text);

      ApiData.signup(
          phoneNumber: _phoneNumberFieldController.text,
          email: _emailFieldController.text,
          bankAccount: _bankAccountFieldController.text,
          bankAccountPassword: _passwordBankAccountFieldController.text,
          userName: _userNameFieldController.text,
          password: _passwordFieldController.text,
          firstName: _firstNameFieldController.text,
          lastName: _secondNameFieldController.text,
          context: context);
    }
  }

  /*We use this function to fetch data from backend 
    api_data.signup() defined in api_data.dart file as static feuter
    we send the phone number , email , user name, password....... and if the order done : 
        1 - move us to comfirme page and send with us the 
            id of this page and the email entered by user*/

  //---------------------------end function section --------------------------------

  @override
  void dispose() {
    //We use .dispose to reformat the TextEditingController and empty their values ​​when the page is finished
    _phoneNumberFieldController.dispose();
    _emailFieldController.dispose();
    _bankAccountFieldController.dispose();
    _passwordBankAccountFieldController.dispose();
    _userNameFieldController.dispose();
    _passwordFieldController.dispose();
    _firstNameFieldController.dispose();
    _secondNameFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*
      titleAppBar, welcomeText, welcomeContentText, signUpText and creatingAccountText :
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
            children: [
              /*the column have a : 
                some text,
                row widget have two text buttom, 
                form widget,
                some text*/

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
                decorationFor: 2, // activate the LogIn button
                leftOnPassed: () {
                  //on click on LogIn text move us to LogIn page
                  Navigator.pushReplacementNamed(context, LogInScreen.id);
                },
              ),
              sBoxH20,

              //this form have a eight textFiled and one button
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /*it is defined in text_field_widget.dart file
                      1 - tNameFild: to know how we design it
                          when we use TypeNameOfFiled.text we need to use hintText
                          hintText : to print text for user on filed 
                      2 - textFieldController: to take the value entered by user
                      3 - validator: to ensure that data entered by user according to a specific format
                      textValidator and passwordValidator defined in validation_constents.dart file*/

                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.phoneNumber,
                      textFieldController: _phoneNumberFieldController,
                      validator: (value) {
                        return phoneNumberValidator(value);
                      },
                    ),
                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.email,
                      textFieldController: _emailFieldController,
                      validator: (value) {
                        return emailValidator(value);
                      },
                    ),
                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.bankAccount,
                      textFieldController: _bankAccountFieldController,
                      validator: (value) {
                        return textValidator(value);
                      },
                    ),
                    PasswordTextFieldWidget(
                      tNameField: TypeNameOfField.passwordBandkAccount,
                      textFieldController: _passwordBankAccountFieldController,
                      validator: (value) {
                        return passwordValidator(value);
                      },
                    ),
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
                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.text,
                      hintText: 'Enter Your First Name',
                      textFieldController: _firstNameFieldController,
                      validator: (value) {
                        return textValidator(value);
                      },
                    ),
                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.text,
                      hintText: 'Enter Your Second Name',
                      textFieldController: _secondNameFieldController,
                      validator: (value) {
                        return textValidator(value);
                      },
                    ),

                    //MaterialButtonWidget defined in button_widget.dart file
                    //it is a button have title and function on tap it
                    MaterialButtonWidget(
                      onTap: () {
                        _onTap();
                      },
                      title: 'Next',
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  creatingAccountText,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      termsOfServiceText,
                      andText,
                      privacyPolicyText,
                    ],
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
