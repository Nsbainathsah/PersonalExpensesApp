import 'package:flutter/foundation.dart'; //@required can only be used by importing the foundation

class Transaction {
  String tID;
  String title;
  double amount;
  DateTime tDate;

  Transaction({
  @required this.tID,
  @required this.title,
  @required this.amount, 
  @required this.tDate
  });
}
