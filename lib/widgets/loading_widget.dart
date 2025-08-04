
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wbid/constents/constents.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: myColor3,
          size: 100,
        ),
      ),
    );
  }
}