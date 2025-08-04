import 'package:flutter/material.dart';

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({
    Key? key,
    required this.materialChild,
    this.horizontalMargen,
    this.margin,
  }) : super(key: key);

  final Widget materialChild;
  final int? horizontalMargen;
  final double? margin;

  EdgeInsets _checkMargen() {
    if (horizontalMargen == 12) {
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 10);
    } else if (margin != null) {
      return EdgeInsets.all(margin!);
    } else {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _checkMargen(),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(15.0),
        child: Expanded(
          child: materialChild,
        ),
      ),
    );
  }
}
