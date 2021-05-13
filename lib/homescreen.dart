import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
          CircleAvatar(
          radius: width*0.7,
          child: ClipOval(
            child: Image.asset(
              "assets/images/home_icon.png",
            ),
          ),
        ),
            FloatingActionButton.extended(

              label: Text("View All Customers"),
              onPressed: () {
                Navigator.pushNamed(context, "/view_all_customers");
              },
            ),
          ],
        ),
      ),
    );
  }
}
