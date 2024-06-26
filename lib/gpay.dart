import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:payment/payment_config.dart';

class payScreen extends StatefulWidget {
  const payScreen({super.key});

  @override
  State<payScreen> createState() => _payScreenState();
}

class _payScreenState extends State<payScreen> {
  String os = Platform.operatingSystem;

  @override
  var googlePayButton = GooglePayButton(
    width: double.infinity,
    height: 50,
    type: GooglePayButtonType.buy,
    theme: GooglePayButtonTheme.dark,
    onPaymentResult: ((result) => debugPrint('Payment result $result')),
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
    paymentItems: const [
      PaymentItem(
        amount: '6.1',
        status: PaymentItemStatus.final_price,
        label: 'Item A',
      ),
      PaymentItem(
        amount: '8.1',
        status: PaymentItemStatus.final_price,
        label: 'Item B',
      ),
      PaymentItem(
        amount: '11.12',
        status: PaymentItemStatus.final_price,
        label: 'Item C',
      ),
    ],
  );
  var applePayButton = ApplePayButton(
    type: ApplePayButtonType.buy,
    width: double.infinity,
    height: 50,
    onPaymentResult: ((result) => debugPrint('Payment result $result')),
    style: ApplePayButtonStyle.black,
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
    paymentItems: const [
      PaymentItem(
        amount: '12',
        status: PaymentItemStatus.final_price,
        label: 'Item A',
      ),
      PaymentItem(
        amount: '2',
        status: PaymentItemStatus.final_price,
        label: 'Item B',
      ),
      PaymentItem(
        amount: '26',
        status: PaymentItemStatus.final_price,
        label: 'Item C',
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Platform.isIOS ? applePayButton : googlePayButton,
        ),
      ),
    );
  }
}
