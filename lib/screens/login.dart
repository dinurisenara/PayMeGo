import 'package:flutter/material.dart';
import 'package:paymego/screens/homeScreen.dart';
import 'package:paymego/screens/signup.dart';


import '../resuable_widgets/reusable_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.05, 20, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                
                
                logoTextWidget('Login',context),
                const SizedBox(
                  height: 60,
                ),
                reusableTextFeild('Email', Icons.person_outline,false, emailTextController, context),
                const SizedBox(
                  height: 40,
                ),
                reusableTextFeild('Password', Icons.lock_outline,true, passwordTextController , context),
                const SizedBox(
                  height: 130,
                ),
                nextButton(context,  () {  Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()), );

                },'Log in'),
                const SizedBox(
                  height: 20,
                ),
                signUpOption(),
                const SizedBox(
                  height: 85,
                ),
                logoWidget('assets/images/logo.png')

              ],
            ),
          ),
        ),
      ),
    );
  }
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text('Don\'t have an account?',
        style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignupScreen()));
          },
          child:  Text('Sign Up',
          style: TextStyle(color:Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
