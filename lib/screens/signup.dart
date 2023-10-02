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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController NICcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != passwordcontroller.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                
                TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    
                  ),
                  validator: validatePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cpasswordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                   
                  ),
                  validator: validateConfirmPassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                IntlPhoneField(
                  
                ),
                nextButton(context, () {
                  if (_formKey.currentState!.validate()) {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Otp()),
                    );
                  }
                }, 'Sign Up'),
                const SizedBox(
                  height: 20,
                ),
                logoWidget('assets/images/logo.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
