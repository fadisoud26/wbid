import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/dartClasses/user_data.dart';

snackBar(String value, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(value),
      //padding: const EdgeInsets.symmetric(
      //horizontal: 8.0,
      //),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}


  //we use this function to sava information in cash memory of the app
  //it's need a object of a UserInfo class which is an input attribute
saveUserData(UserInfo user1) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('username', user1.userName.toString());
  preferences.setString('password', user1.password.toString());
  preferences.setString('email', user1.email.toString());
  preferences.setString('phone', user1.phoneNumber.toString());
  preferences.setString('firstname', user1.firstName.toString());
  preferences.setString('lastname', user1.lastname.toString());
  preferences.setString('amount', user1.amount.toString());
  preferences.setString('member_since', user1.memberSince.toString());
  preferences.setString('bankAcc', user1.bankAcc.toString());
  preferences.setString('bankAccPass', user1.bankAccPass.toString());

  publicPhoneNumber = user1.phoneNumber.toString();
  publicEmail = user1.email.toString();
  publicBankAccount = user1.bankAcc.toString();
  publicBankAccountPassword = user1.bankAccPass.toString();
  publicUserName = user1.userName.toString();
  publicPassword = user1.password.toString();
  publicFirstName = user1.firstName.toString();
  publicLastName = user1.lastname.toString();
  publicAmount = user1.amount.toString();
  publicMemberSince = user1.memberSince.toString();
/*
  userName = preferences.getString('username');
  password = preferences.getString('password');
  email = preferences.getString('email');
  phoneNumber = preferences.getString('phone');
  firstName = preferences.getString('firstname');
  lastName = preferences.getString('lastname');
  amount = preferences.getString('amount');
  memberSince = preferences.getString('member_since');
  bankAcc = preferences.getString('bankAcc');
  bankAccPass = preferences.getString('bankAccPass');
*/
}

logoutWithSaredPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove('username');
  preferences.remove('email');
  preferences.remove('phone');
  preferences.remove('firstname');
  preferences.remove('lastname');
  preferences.remove('amount');
  preferences.remove('member_since');
  preferences.remove('password');
  preferences.remove('bankAcc');
  preferences.remove('bankAccPass');
}
