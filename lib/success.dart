import 'package:flutter/material.dart';

import 'send_money.dart';
import 'view_all_customers.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(

        title: Text("Success"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.done,
                size: width * 0.5,
                color: Colors.green,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                "Sent Successfully",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                height: height * 0.27,
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
                                "Sender : ",
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
                                "Amount : ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                transfer_amount.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
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
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/view_all_customers");
                },
                label: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    Text("Back"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}