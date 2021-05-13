import 'package:basic_banking_app/send_money.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String selected_user_name = "";
int selected_user_id;
String selected_user_email;
int selected_account_balance;
String selected_user_doc_id;
String selected_image_url;

class SelectUser extends StatefulWidget {
  @override
  _SelectUserState createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Customer"),
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("user_data").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    snapshot.data.docs[index]["image_url"].toString(),
                  ), // ,
                ),
              ),
              title:
              Text(snapshot.data.docs[index]["user_name"].toString()),
              subtitle:
              Text(snapshot.data.docs[index]["user_id"].toString()),
              trailing: Text(
                "\$" +
                    snapshot.data.docs[index]["account_balance"].toString(),
                style: TextStyle(
                  color: Color(0xFF81C784),
                ),
              ),
              onTap: () {
                Future _selecting()async{
                  selected_user_name =
                  (snapshot.data.docs[index]["user_name"].toString());
                  selected_user_id = (snapshot.data.docs[index]["user_id"]);
                  selected_user_email =
                  (snapshot.data.docs[index]["user_email"].toString());
                  selected_image_url =
                  (snapshot.data.docs[index]["image_url"].toString());
                  selected_account_balance =
                      int.parse(snapshot.data.docs[index]["account_balance"]);
                  selected_user_doc_id =
                  (snapshot.data.docs[index].id.toString());

                  account_number =await selected_user_id.toString();
                  account_name =await selected_user_name;
                  print(account_name+account_number);
                }
                setState(() {
                  _selecting();
                  Navigator.pop(context,"/send_money");
                });
              },
            ),
          );
        },
      ),
    );
  }
}
//
