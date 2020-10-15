import 'package:PersonalExpensesApp/Widgets/newTransaction.dart';
import 'package:PersonalExpensesApp/Widgets/transactionList.dart';
import 'package:flutter/material.dart';
import 'Models/Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),

      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

/*TextEditingController is a class provided by flutter. 
You can assign controllers to textfields to automatically connect the controller to the text and save the user input */

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

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
  
  void _startNewTransaction(BuildContext bldctx) {
    showModalBottomSheet(
      context: (bldctx),
      builder: (_) {
        return GestureDetector(
          onTap: (){},
          behavior: HitTestBehavior.opaque, //prevents modal sheet from closing if tapped on white space
          child: NewTransaction(_addNewTransaction));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () => _startNewTransaction(context))],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART!'),
            ),
          ),
          TransactionList(_userTransactionsList)
        ] //close column children
        ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: IconButton(icon: Icon(Icons.add), onPressed: null),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }
}
