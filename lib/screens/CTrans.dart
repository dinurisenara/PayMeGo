import 'package:flutter/material.dart';
import 'package:paymego/resuable_widgets/reusable_widgets.dart';
import 'package:paymego/screens/homeScreen.dart';

import 'otp.dart';

class CardPayments extends StatefulWidget {
  const CardPayments({super.key});

  @override
  State<CardPayments> createState() => _CardPaymentsState();
}

class _CardPaymentsState extends State<CardPayments> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: cmnappbar(context), 
      body:  Column(children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              'Card Payments',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.05, 20, 0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                    
                ),
                borderRadius: BorderRadius.circular(20),
              ),
          child:  Column(children: [
            paymentTextfeild('Amount'),
              
                paymentTextfeild('Card Holder Name'),
                 paymentTextfeild('Card Number'),
                paymentTextfeild('Description'),
                const SizedBox(
                  height: 20,
                ),
                nextButton(context, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>const HomeScreen() ));
            }, 'Next')
               
          ])
        ),
        
      )
      

        

        
        


      ]),

     
    );
  }
}

