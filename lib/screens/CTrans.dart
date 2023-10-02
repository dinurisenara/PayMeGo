import 'package:flutter/material.dart';
import 'package:paymego/resuable_widgets/reusable_widgets.dart';

class CardPayments extends StatefulWidget {
  const CardPayments({super.key});

  @override
  State<CardPayments> createState() => _CardPaymentsState();
}

class _CardPaymentsState extends State<CardPayments> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: cmnappbar(context), 

     
    );
  }
}