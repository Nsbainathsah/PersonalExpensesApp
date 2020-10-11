import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  NewTransaction(this.addTx);

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
            ),
            TextField(
              controller: amountInputController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            FlatButton(
              onPressed: () {
                addTx(titleInputController.text,
                    double.parse(amountInputController.text)
                    );
              },
              textColor: Colors.purple,
              child: Text('Add transaction'),
            )
          ],
        ),
      ),
    );
  }
}
