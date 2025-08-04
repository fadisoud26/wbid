import 'package:wbid/constents/text_style_constents.dart';
import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {Key? key,
      this.title,
      this.onTap,
      this.minWidth,
      this.heigh,
      this.backgroundColor})
      : super(key: key);

  final Function()? onTap;
  final String? title;
  final double? minWidth;
  final double? heigh;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        elevation: 4.0,
        color: (backgroundColor != null) ? backgroundColor : myColor3,
        borderRadius: BorderRadius.circular(20.0),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: minWidth,
          height: (heigh != null) ? heigh : 60,
          child: Text(
            title!,
            style: (backgroundColor != null)?f20BlackTextStyle: f20WhiteTextStyle
          ),
        ),
      ),
    );
  }
}
