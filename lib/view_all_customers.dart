import 'package:basic_banking_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String user_name;
int user_id;
String user_email;
int account_balance;
String user_doc_id;
String image_url;

class AllCustomers extends StatefulWidget {
  @override
  _AllCustomersState createState() => _AllCustomersState();
}

class _AllCustomersState extends State<AllCustomers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("All Customers"),
        actions: [
          IconButton(
              tooltip: "History",
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.pushNamed(context, "/history");
              })
        ],
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
              title: Text(snapshot.data.docs[index]["user_name"].toString()),
              subtitle: Text(snapshot.data.docs[index]["user_id"].toString()),
              trailing: Text(
                "\$" + snapshot.data.docs[index]["account_balance"].toString(),
                style: TextStyle(
                  color: Color(0xFF81C784),
                ),
              ),
              onTap: () => {
                user_name = (snapshot.data.docs[index]["user_name"].toString()),
                user_id = (snapshot.data.docs[index]["user_id"]),
                user_email =
                    (snapshot.data.docs[index]["user_email"].toString()),
                image_url = (snapshot.data.docs[index]["image_url"].toString()),
                account_balance =
                    int.parse(snapshot.data.docs[index]["account_balance"]),
                user_doc_id = (snapshot.data.docs[index].id.toString()),
                Navigator.pushNamed(context, "/view_one_customer"),
              },
            ),
          );
        },
      ),
    );
  }
}
//
