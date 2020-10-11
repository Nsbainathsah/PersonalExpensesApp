import './Transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        tID: 'T1', title: 'One Plus 8T', amount: 699.99, tDate: DateTime.now()),
    Transaction(
        tID: 'T2',
        title: 'LG Ultrawide',
        amount: 1299.99,
        tDate: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('CHART!'),
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    FlatButton(
                      onPressed: () {},
                      textColor: Colors.purple,
                      child: Text('Add transaction'),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )),
                        child: Text(
                          //transaction card amount
                          '\$${tx.amount}', //String interpolation (Dart feature) replaces .toString() adds all Strings inside curly braces together
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        //Column containing the title and date of a transaction
                        crossAxisAlignment: CrossAxisAlignment.start, //alligns the transaction to the right
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          //transaction card title
                          Text(
                            DateFormat.yMMMd().format(tx.tDate),
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          )
                        ], //transaction card date
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ] //close column children
          ,
        ));
  }
}
