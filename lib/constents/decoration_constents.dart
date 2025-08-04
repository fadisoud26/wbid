import 'package:flutter/material.dart';
import 'text_style_constents.dart';

const textFieldDecoration = InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.all(20),
  hintStyle: f15GreyTextStyle,
);

const bidNumberTextFieldDecoration = InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.all(20),
  hintStyle: f15GreyTextStyle,
  hintText: '.....',
);

const passwordFieldDecoration = InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.all(20),
  prefixIcon: Icon(Icons.lock),
  hintStyle: f15GreyTextStyle,
);

const dataTimeTextFieldDecoration = InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.all(20),
);
