import 'package:flutter/material.dart';

import '../widgets/card_payment.dart';
class PaymentScreen extends StatelessWidget {
   PaymentScreen({Key?key}) : super(key: key);
  static String id="PaymentScreenId";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'طرق الدفع',
        ),

      ),
      backgroundColor: const Color.fromARGB(234, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          CardPayment(title: 'Vodafone Cash', image: 'assets/images/b1.png'),
          CardPayment(title: 'Cash', image: 'assets/images/b2.png'),
          CardPayment(title: 'Visa', image: 'assets/images/b6.png'),
          CardPayment(title: 'Mastercard', image: 'assets/images/b7.png'),
          CardPayment(title: 'PayPal', image: 'assets/images/img.png'),
        ],
      ),
    );
  }
}
