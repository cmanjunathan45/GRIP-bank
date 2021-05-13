import 'package:basic_banking_app/select_user.dart';
import 'package:basic_banking_app/view_all_customers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class SendMoney extends StatefulWidget {
  @override
  _SendMoneyState createState() => _SendMoneyState();
}

TextEditingController amount = TextEditingController();
String account_number = "";
int update_selected_account_balance;
int transfer_amount;
String account_name = "";
int new_account_balance;
String _timeString;
class _SendMoneyState extends State<SendMoney> {
  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(

        title: Text("Transfer"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    "Balance         : ",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "\$" + account_balance.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/select_user");
                },
                child: Text("Select Account Number"),
                color: Colors.pink,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    "Acc.No         : ",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text("$account_number-$account_name"),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    "Amount         : ",
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    height: height * .1,
                    width: width * 0.4,
                    child: TextFormField(
                      controller: amount,
                      validator: (val) {
                        if (val.isEmpty ||
                            val.contains("-") ||val=="0"||
                            val.contains("+") ||
                            val.contains("*") ||
                            val.contains("/")) {
                          return "Invalid Amount";
                        } else if ((int.parse(val) > account_balance)) {
                          return "Insufficient Balance";
                        } else if ((int.parse(val) == account_balance)) {
                          return "Account Balance can't \nbe 0";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Amount",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
                top: 20.0,
              ),
              child: FloatingActionButton.extended(
                label: Row(
                  children: [
                    Icon(Icons.attach_money),
                    Text(
                      "Send",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                onPressed: () async {


                  if (_formKey.currentState.validate()) {
                    // transfer_money();
                    setState(()  {
                      transfer_amount = int.parse(amount.text);

                      new_account_balance =
                          account_balance - transfer_amount;

                      update_selected_account_balance =
                          selected_account_balance + transfer_amount;
                      Map<String, dynamic> sender_data = {
                        "account_balance": "$new_account_balance"
                      };
                      Map<String, dynamic> receiver_data = {
                        "account_balance": "$update_selected_account_balance"
                      };
                      FirebaseFirestore.instance
                          .collection("user_data")
                          .doc(user_doc_id)
                          .update(sender_data);
                      FirebaseFirestore.instance
                          .collection("user_data")
                          .doc(selected_user_doc_id)
                          .update(receiver_data);
                      print(account_balance);
                      print(selected_account_balance);
                    });

                   await FirebaseFirestore.instance.collection('transaction_history').add({
                      "amount": amount.text,
                      "from_id": user_id,
                      "to_id": account_number,
                      "from_name": user_name,
                      "to_name": account_name,
                     "time":FieldValue.serverTimestamp(),
                    });

                    Navigator.pushNamed(context, "/success");
                  } else {
                    print("");
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
                top: 20.0,
              ),
              child: FloatingActionButton.extended(
                  heroTag: 1,
                  label: Row(
                    children: [
                      Icon(Icons.arrow_back_sharp),
                      Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
