import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:paymego/screens/homeScreen.dart';
import 'package:paymego/screens/login.dart';

// Logo widget
Image logoWidget(String path) {
  return Image.asset(path, fit: BoxFit.fitWidth, width: 80, height: 80);
}

// Logo text widget
Text logoTextWidget(String text, context) {
  return Text(text,
      style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 46,
          fontWeight: FontWeight.bold));
}
// Reusable text field

TextField reusableTextFeild(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, context) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Theme.of(context).colorScheme.primary,
    style: TextStyle(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

// Reusable button

Container nextButton(BuildContext context, Function onTap, String buttonText) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).colorScheme.secondary.withOpacity(0.5);
          } else {
            return Theme.of(context).colorScheme.primary.withOpacity(0.9);
          }
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Drawer drawerWidget(BuildContext context) {
  return Drawer(
    backgroundColor: Theme.of(context).colorScheme.primary,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text('data'),
          accountEmail: const Text('data'),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        menueItem(context, 'Transaction History', () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }),
        menueItem(context, 'Add Payment Method', () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }),
        menueItem(context, 'Account Information', () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }),
        
        menueItem(context, 'Logout', () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Login()));
        }),
      ],
    ),
  );
}

ListTile menueItem(BuildContext context, String text, Function f ) {
  return ListTile(
    
    title: ElevatedButton(
     
      
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).colorScheme.secondary.withOpacity(0.5);
          } else {
            return Theme.of(context).colorScheme.primary.withOpacity(0.9);
          }
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),  
      onPressed: () => f(),
      child: Text(
        text,
        
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 20,
          
          
        ),
        
      ),
      
    ),
    minVerticalPadding: 20,
    contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  );
}

AppBar cmnappbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: logoWidget('assets/images/logo.png'),
    toolbarHeight: 100,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.person_2_outlined,
        ),
        padding: const EdgeInsets.only(right: 20),
      ),
    ],
    centerTitle: true,
    iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
  );
}

gridItem(
    BuildContext context, String s, IconData requestPage, Function function) {
  return InkWell(
    onTap: () {
      function();
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const HomeScreen()), );
    },
    child: Card(
      

      margin: const EdgeInsets.all(25),
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              requestPage,
              size: 50,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              s,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

TextField paymentTextfeild(String text) {
  return TextField(
    decoration: InputDecoration(
      border: const UnderlineInputBorder(),
      labelText: text,
    ),
  );
}
