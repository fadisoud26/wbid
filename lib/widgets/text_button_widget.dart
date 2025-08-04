import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {Key? key, this.tStyle, this.text, this.textDecoration, this.onTap})
      : super(key: key);

  final TextStyle? tStyle;
  final String? text;
  final TextDecoration? textDecoration;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text!,
        style: tStyle!.copyWith(
          decoration: textDecoration,
          color: (textDecoration == TextDecoration.underline)
              ? Colors.black
              : Colors.grey,
        ),
      ),
    );
  }
}
