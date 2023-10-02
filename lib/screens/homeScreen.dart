import 'package:flutter/material.dart';
import 'package:paymego/resuable_widgets/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget( context),
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
              Icons.person_2_outlined,
            ),
            padding: const EdgeInsets.only(right: 20),
          ),
        ],
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
