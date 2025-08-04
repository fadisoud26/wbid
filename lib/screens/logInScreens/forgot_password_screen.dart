import 'package:wbid/constents/text_constents.dart';
import 'package:wbid/constents/validation_constents.dart';
import 'package:wbid/dartClasses/api_data.dart';
import 'package:wbid/screens/logInScreens/confirme_screen.dart';
import 'package:wbid/screens/logInScreens/log_in_screen.dart';
import 'package:wbid/widgets/material_button_widget.dart';
import 'package:wbid/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  //This string variable is the identity of the page
  //we use it in routes attribute of MaterialApp widget in main file
  //id can help us to Page Navigation
  static const String id = 'forgot_password_screen';
  static String? email, userName;

  static void set({String? mail}) {
    email = mail;
  }

  static void forgotPasswordNotify(context) {
    Navigator.pushNamed(
      context,
      ConfirmeScreen.id,
      arguments: {
        'id': 'forgot_screen',
        'emailController': email,
        'userNameController': ' ',
      },
    );
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //^^^^^^^^^^^^^^^^^^^^^^^^^start variables section^^^^^^^^^^^^^^^^^^^^^^^^^^^

  // _formKey is a private varriabe and we use it in key attribute of Form widget
  // We can apply some functions to it
  final _formKey = GlobalKey<FormState>();

  // the TextEditingController Contains input values ​​from textFiledWidget
  final _emailFieldController = TextEditingController();
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

  void _onTap(){
    if (_saveForm()) {
                          ApiData.forgetpass(
                              email: _emailFieldController.text,
                              newPassword: _passwordFieldController.text,
                              context: context);
                        }
  }

  //---------------------------end function section --------------------------------

  @override
  void dispose() {
    //We use .dispose to reformat the TextEditingController and empty their values ​​when the page is finished
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*
      titleAppBar, forgotPasswordText, contentTextOfForgotPasswordScreen, ..... :
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
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(
              context,
              LogInScreen.id,
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 25,
          color: Colors.black,
        ),
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
                form widget*/

              sBoxH30,
              forgotPasswordText,
              sBoxH10,
              contentTextOfForgotPasswordScreen,
              sBoxH20,

              //this form have a two textFiled and one button
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /*it is defined in text_field_widget.dart file
                      1 - tNameFild: to know how we design it
                      2 - textFieldController: to take the value entered by user
                      3 - validator: to ensure that data entered by user according to a specific format
                      textValidator and passwordValidator defined in validation_constents.dart file*/

                    NormalTextFieldWidget(
                      tNameField: TypeNameOfField.email,
                      textFieldController: _emailFieldController,
                      validator: (value) {
                        return emailValidator(value);
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
                      title: 'Send',
                    ),
                  ],
                ),
              ),
              sBoxH20,
            ],
          ),
        ),
      ),
    );
  }
}
