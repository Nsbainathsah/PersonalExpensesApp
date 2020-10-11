import 'package:PersonalExpensesApp/Models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
                crossAxisAlignment: CrossAxisAlignment
                    .start, //alligns the transaction to the right
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
    );
  }
}
