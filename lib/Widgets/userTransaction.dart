import 'package:PersonalExpensesApp/Widgets/newTransaction.dart';
import 'package:PersonalExpensesApp/Widgets/transactionList.dart';
import 'package:flutter/material.dart';
import '../Models/Transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactionsList = [
    Transaction(
        tID: 'T1', 
        title: 'One Plus 8T', 
        amount: 699.99, 
        tDate: DateTime.now()),
    Transaction(
        tID: 'T2',
        title: 'LG Ultrawide',
        amount: 1299.99,
        tDate: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        tID: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        tDate: DateTime.now());

    setState(() {
      _userTransactionsList.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction), //pass the addNewTransaction method to the NewTransaction widgetclass
        TransactionList(_userTransactionsList),
      ],
    );
  }
}
