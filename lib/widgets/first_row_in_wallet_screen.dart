import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/widgets/material_widget.dart';

const currentWalletBalanceText = Text(
  'current wallet \nbalance',
  textAlign: TextAlign.center,
  style: f18BlackTextStyle,
);

const availablBalanceInBankText = Text(
  'available balance in bank account',
  textAlign: TextAlign.center,
  style: f18BlackTextStyle,
);

class FirstRowInWalletScreen extends StatelessWidget {
  const FirstRowInWalletScreen({
    Key? key,
    this.currentWalletBalance,
    this.availableBalanceInBankAccount,
  }) : super(key: key);

  final String? currentWalletBalance;
  final String? availableBalanceInBankAccount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialWidget(
            margin: 10,
            materialChild: Column(
              children: [
                sBoxH20,
                currentWalletBalanceText,
                sBoxH20,

               Text(
                  '$currentWalletBalance \$',
                  textAlign: TextAlign.center,
                  style: f18C3TextStyle,
                ),
                sBoxH20,
              ],
            ),
          ),
        ),
        Expanded(
          child: MaterialWidget(
            margin: 10,
            materialChild: Column(
              children: [
                sBoxH20,
                availablBalanceInBankText,
                sBoxH20,

              Text(
                  '$availableBalanceInBankAccount \$',
                  textAlign: TextAlign.center,
                  style: f18C3TextStyle,
                ),
                sBoxH20,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
