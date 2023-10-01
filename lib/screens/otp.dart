import 'package:flutter/material.dart';
import 'package:paymego/resuable_widgets/reusable_widgets.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:paymego/screens/login.dart';

import 'homeScreen.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Signup',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
       
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Enter OTP sent to your mobile',
              style: TextStyle(fontSize: 18 , color: Colors.white),
            ),
            const SizedBox(height: 70),
            OtpTextField(
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {
                // Verify the OTP entered by the user
                // You can add your OTP verification logic here
                // For a UI example, you can check if the entered OTP matches a predefined value
                String enteredOTP = otpController.text;
                String predefinedOTP = '123456'; // Replace with your OTP
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                if (enteredOTP == predefinedOTP) {
                  
                } else {
                  // OTP is invalid, show an error message
                  print('Invalid OTP');
                }
              },
              child: const Text('Verify OTP'),
            ),
            const SizedBox(
              height: 230,
            ),
            logoWidget('assets/images/logo.png')
          ]),
        )),
      ),
    );
  }
}
