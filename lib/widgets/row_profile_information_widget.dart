import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/text_style_constents.dart';

class RowProfileInformationWidget extends StatelessWidget {
  const RowProfileInformationWidget({Key? key, this.title, this.value})
      : super(key: key);

  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 8, 8),
      child: Row(
        children: [
          Text(
            title ?? '',
            style: f18BlackTextStyle,
          ),
          sBoxW10,
          Text(
            value ?? '',
            style: f18BlackTextStyle,
          ),
        ],
      ),
    );
  }
}
