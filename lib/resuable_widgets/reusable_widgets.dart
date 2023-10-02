



import 'package:flutter/material.dart';

// Logo widget 
Image logoWidget(String path) {
  return Image.asset(path,fit: BoxFit.fitWidth, width: 80, height: 80);
}
// Logo text widget
Text logoTextWidget(String text , context) {
  return Text(text, style:  TextStyle(color: Theme.of(context).colorScheme.primary, 
  fontSize: 46, fontWeight: FontWeight.bold));
}
// Reusable text field

TextField reusableTextFeild( String text , IconData icon ,
 bool isPasswordType, TextEditingController controller,  context){
  return TextField(
  controller: controller,
  
  obscureText: isPasswordType,
  enableSuggestions: !isPasswordType,
  autocorrect: !isPasswordType,
  cursorColor: Theme.of(context).colorScheme.primary,
  style:  TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.9)),
  decoration: InputDecoration(prefixIcon:  Icon( icon, color: Colors.white70, ),
  labelText: text,
  labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.9)),
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  fillColor:Theme.of(context).colorScheme.primary.withOpacity(0.3),
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

Container nextButton(BuildContext context, Function onTap , String buttonText) {
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
      child:  Text(
        buttonText,
        style:  TextStyle(
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
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}






