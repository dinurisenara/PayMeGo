import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:paymego/resuable_widgets/reusable_widgets.dart';

import 'package:paymego/screens/otp.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController fnamecontroller = TextEditingController();
    TextEditingController NICcontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController cpasswordcontroller = TextEditingController();
    TextEditingController phonecontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Text(
          'Signup',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
        ),
        centerTitle: true,
        iconTheme:  IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            reusableTextFeild(
                'Full Name', Icons.person, false, fnamecontroller , context),
            const SizedBox(
              height: 20,
            ),
            reusableTextFeild('NIC', Icons.person_2, false, NICcontroller , context),
            const SizedBox(
              height: 20,
            ),
            reusableTextFeild('Email', Icons.email, false, emailcontroller , context ),
            const SizedBox(
              height: 20,
            ),
            reusableTextFeild('Password', Icons.lock, true, passwordcontroller , context),
            const SizedBox(
              height: 20,
            ),
            reusableTextFeild(
                'Confirm Password', Icons.lock, true, cpasswordcontroller, context ),
            const SizedBox(
              height: 20,
            ),
            IntlPhoneField(
              controller: phonecontroller,
              decoration: InputDecoration(                
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                labelText: 'Phone Number',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.9)),
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            nextButton(context, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Otp()));
            }, 'Sign Up'),
            const SizedBox(
              height: 20,
            ),
            logoWidget('assets/images/logo.png')
          ]),
        )),
      ),
    );
  }
}
