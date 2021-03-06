import 'package:PersonalExpensesApp/Models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index){
          return Card(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )),
                  child: Text(
                    //transaction card amount
                    '\$${transactions[index].amount.toStringAsFixed(2)}', //String interpolation (Dart feature) replaces .toString() adds all Strings inside curly braces together, to string still added for 2 decimal places
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Column(
                  //Column containing the title and date of a transaction
                  crossAxisAlignment: CrossAxisAlignment.start, //alligns the transactionbutton to the right
                  children: [
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    //transaction card title
                    Text(
                      DateFormat.yMMMd().format(transactions[index].tDate),
                      style: TextStyle(
                        fontSize: 10, 
                        color: Theme.of(context).primaryColor),
                    )
                  ], //transaction card date
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
