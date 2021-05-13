import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("History"),

        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("transaction_history")
              .orderBy("time", descending: true)
              .limit(3)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data.docs.length == 0) {
              return Center(
                child: Text("No transaction history found"),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (ctx, index) => ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(snapshot.data.docs[index]["from_name"]
                                  .toString() +
                              "-" +
                              snapshot.data.docs[index]["from_id"].toString()),
                          Icon(
                            Icons.forward,
                            color: Colors.green,
                          ),
                          Text(snapshot.data.docs[index]["to_name"].toString() +
                              "-" +
                              snapshot.data.docs[index]["to_id"].toString()),
                        ],
                      ),
                      subtitle: Text(
                        "\$" + snapshot.data.docs[index]["amount"].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: ()async{
                              FirebaseFirestore.instance
                                  .collection("transaction_history")
                                  .doc(snapshot.data.docs[index].id.toString())
                                  .delete();
                              print(snapshot.data.docs[index].id);

                            },
                          ),
                        ],
                      ),
                    ));
          },
        ));
  }
}
