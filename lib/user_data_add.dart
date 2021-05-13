import 'package:basic_banking_app/view_all_customers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserExample extends StatefulWidget {
  @override
  _UserExampleState createState() => _UserExampleState();
}

class _UserExampleState extends State<UserExample> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController accountBalanceController = TextEditingController();
  String _time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: userIdController,
              decoration: InputDecoration(
                hintText: "ID",
              ),
            ),
            TextFormField(
              controller: userEmailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            TextFormField(
              controller: accountBalanceController,
              decoration: InputDecoration(
                hintText: "Balance",
              ),
            ),
            FlatButton(
              onPressed: () {
                void _getTime() {
                  final String formattedDateTime =
                  DateFormat('MM/dd/yyyy \n kk:mm:ss').format(DateTime.now()).toString();
                  setState(() {
                    _time = formattedDateTime;
                  });
                  print(_time);
                }
                DateTime currentPhoneDate = DateTime.now(); //DateTime

                Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //To TimeStamp

                DateTime myDateTime = myTimeStamp.toDate(); // TimeStamp to DateTime

                print("current phone data is: $currentPhoneDate");
                print("current phone data is: $myDateTime");
                print(DateTime.parse(myTimeStamp.toDate().toString()));
                // _getTime();

                // print(FirebaseFirestore.instance.collection("user_data").doc(user_id.toString()));
                // FirebaseFirestore.instance.collection('user_data').add({
                //   "user_id": userIdController.text,
                //   "user_name": userNameController.text,
                //   "user_email": userEmailController.text,
                //   "account_balance": accountBalanceController.text,
                // });
              },
              child: Text(
                "Add Data",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
