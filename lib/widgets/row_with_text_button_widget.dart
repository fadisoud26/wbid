


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/widgets/text_button_widget.dart';


// ----------------------- with 2 text button ---------------------
class RowWith2TextButtonWidget extends StatelessWidget {
  const RowWith2TextButtonWidget({
    Key? key,
    this.decorationFor,
    this.leftHintText,
    this.rightHintTtext,
    this.leftOnPassed,
    this.rightOnPassed,
  }) : super(key: key);

  final int? decorationFor;
  final String? leftHintText, rightHintTtext;
  final Function()? leftOnPassed, rightOnPassed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButtonWidget(
            tStyle: f20BlackTextStyle,
            text: leftHintText ?? logInText,
            textDecoration: (decorationFor == 1)
                ? TextDecoration.underline
                : TextDecoration.none,
            onTap: leftOnPassed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButtonWidget(
            tStyle: f20BlackTextStyle,
            text: rightHintTtext ?? signUpText,
            textDecoration: (decorationFor == 2)
                ? TextDecoration.underline
                : TextDecoration.none,
            onTap: rightOnPassed,
          ),
        ),
      ],
    );
  }
}



// --------------------- with 4 text button-----------------------------

class RowWith4TextButtonWidget extends StatelessWidget {
  const RowWith4TextButtonWidget({
    Key? key,
    this.firstText,
    this.secondText,
    this.thirdText,
    this.fourthText,
    this.decorationFor,
    this.firstOnPassed,
    this.secondOnPassed,
    this.thirdOnPassed,
    this.fourthOnPassed,
    this.iconOnPassed,
  }) : super(key: key);

  final String? firstText, secondText, thirdText, fourthText;
  final DecorationOf? decorationFor;
  final Function()? firstOnPassed,
      secondOnPassed,
      thirdOnPassed,
      fourthOnPassed,
      iconOnPassed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: TextButtonWidget(
            tStyle: f14BlackTextStyle,
            text: firstText,
            textDecoration: (decorationFor == DecorationOf.first)
                ? TextDecoration.underline
                : TextDecoration.none,
            onTap: firstOnPassed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: TextButtonWidget(
            tStyle: f14BlackTextStyle,
            text: secondText,
            textDecoration: (decorationFor == DecorationOf.second)
                ? TextDecoration.underline
                : TextDecoration.none,
            onTap: secondOnPassed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: TextButtonWidget(
            tStyle: f14BlackTextStyle,
            text: thirdText,
            textDecoration: (decorationFor == DecorationOf.third)
                ? TextDecoration.underline
                : TextDecoration.none,
            onTap: thirdOnPassed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: TextButtonWidget(
            tStyle: f14BlackTextStyle,
            text: fourthText,
            textDecoration: (decorationFor == DecorationOf.fourth)
                ? TextDecoration.underline
                : TextDecoration.none,
            onTap: fourthOnPassed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
              size: 27,
            ),
            onPressed: iconOnPassed,
          ),
        ),
      ],
    );
  }
}
