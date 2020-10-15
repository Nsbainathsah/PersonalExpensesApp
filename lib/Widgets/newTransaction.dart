import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  void submitTransaction() {
    final enteredText = titleInputController.text;
    final enteredAmount = double.parse(amountInputController.text);

    if (enteredText.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
        titleInputController.text, double.parse(amountInputController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleInputController,
              decoration: InputDecoration(labelText: 'Title'),
              onSubmitted: (val) => submitTransaction(),
            ),
            TextField(
              controller: amountInputController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (val) =>
                  submitTransaction(), //val is added because onSubmitted returns the value that the user typed into the textfield
            ),
            FlatButton(
              onPressed: submitTransaction,
              textColor: Theme.of(context).primaryColor,
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
