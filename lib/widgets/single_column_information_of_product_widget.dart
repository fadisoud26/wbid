import 'package:wbid/constents/text_style_constents.dart';
import 'package:flutter/material.dart';

class SingleColumnInformationOfProduct extends StatefulWidget {
  const SingleColumnInformationOfProduct({Key? key, this.title, this.value})
      : super(key: key);

  final String? title, value;

  @override
  State<SingleColumnInformationOfProduct> createState() => _SingleColumnInformationOfProductState();
}

class _SingleColumnInformationOfProductState extends State<SingleColumnInformationOfProduct> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.title ?? '',
            style: f18BlackTextStyle,
          ),
          Text(
            widget.value?? '',
            style: f18C3TextStyle,
          ),
        ],
      ),
    );
  }
}
