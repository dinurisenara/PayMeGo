import 'package:flutter/material.dart';
import 'package:paymego/resuable_widgets/reusable_widgets.dart';
import 'package:paymego/screens/Btransfers.dart';
import 'package:paymego/screens/CTrans.dart';
import 'package:paymego/screens/QRpay.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}



IconData iconlight = Icons.wb_sunny;  
IconData icondark = Icons.nights_stay;



class HomeScreenState extends State<HomeScreen> {
  bool isdark = false;
  bool get isDark { return isdark;}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(context ),
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Text(
            'Good morning',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        elevation: 0,
        title: logoWidget('assets/images/logo.png'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
            ),
            padding: const EdgeInsets.only(right: 20),
          ),
        ],
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          gridItem(context, 'Card Payment', Icons.send, () {Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CardPayments()), );}),
          gridItem(context, 'Bank Transfer', Icons.money, () {Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Btransfer()), );}),
          gridItem(context, 'Transactions', Icons.money, () {}),
          gridItem(context, 'QR Pay', Icons.qr_code, () {Navigator.push(context,
          MaterialPageRoute(builder: (context) => QRpay()), );}),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isdark = !isdark;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
       
        child: Icon(
          isdark ? icondark : iconlight,
          color: Theme.of(context).colorScheme.secondary,
        )
      ),
      
       
    );
  }
  
  
  
}



