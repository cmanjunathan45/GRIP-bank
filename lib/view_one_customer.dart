import 'package:basic_banking_app/view_all_customers.dart';
import 'package:flutter/material.dart';

class OneCustomer extends StatefulWidget {
  @override
  _OneCustomerState createState() => _OneCustomerState();
}

class _OneCustomerState extends State<OneCustomer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(

        title: Text("Profile"),

      ),
      body: SingleChildScrollView (
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("$image_url"),
                radius: width * 0.3,

              ),
              Container(
                height: height * 0.35,
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 20.0,
                      bottom: 18.0,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Name : ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                user_name,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            children: [
                              Text(
                                "Account Number : ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                user_id.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            children: [
                              Text(
                                "Email : ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                user_email,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            children: [
                              Text(
                                "Balance : ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                "\$$account_balance",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              FloatingActionButton.extended(
                label: Text("Send Money"),
                onPressed: () {
                  Navigator.pushNamed(context, "/send_money");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
