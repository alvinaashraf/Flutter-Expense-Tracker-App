import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transactionList.dart';
import 'package:flutter/material.dart';

class userTransactions extends StatefulWidget {
  @override
  _userTransactionsState createState() => _userTransactionsState();
}

final List<Transaction> _userTransaction = [
  Transaction(
    id: "001",
    title: "something",
    amount: 900,
    date: DateTime.now(),
  ),
  Transaction(
    id: "002",
    title: "shirtss",
    amount: 900,
    date: DateTime.now(),
  ),
];

class _userTransactionsState extends State<userTransactions> {
  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        transactionList(_userTransaction),
      ],
    );
  }
}
