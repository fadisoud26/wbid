import 'package:flutter/cupertino.dart';
import 'package:wbid/constents/text_style_constents.dart';

class RowWith3NormalText extends StatelessWidget {
  const RowWith3NormalText({Key? key, this.first, this.second, this.third})
      : super(key: key);

  final String? first, second, third;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first ?? '',
            style: f16BlackTextStyle,
          ),
          Text(
            second ?? '',
            style: f16BlackTextStyle,
          ),
          Text(
            third ?? '',
            style: f16BlackTextStyle,
          ),
        ],
      ),
    );
  }
}
