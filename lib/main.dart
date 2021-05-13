import 'package:firebase_core/firebase_core.dart';

import 'history.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'select_user.dart';
import 'send_money.dart';
import 'success.dart';
import 'test_page.dart';
import 'user_data_add.dart';
import 'view_all_customers.dart';
import 'view_one_customer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      // initialRoute: "/user_example",
      routes: {

        "/home": (context) => Home(),
        "/view_all_customers": (context) => AllCustomers(),
        "/view_one_customer": (context) => OneCustomer(),
        "/send_money": (context) => SendMoney(),
        "/history": (context) => History(),
        "/success": (context) => Success(),
        "/user_example": (context) => UserExample(),
        "/test_page": (context) => TestPage(),
        "/select_user": (context) => SelectUser(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("SPARKS FOUNDATION"),
        centerTitle: true,
      ),
      body: HomeBody(),
    );
  }
}
