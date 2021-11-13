import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class transactionList extends StatelessWidget {
  final List<Transaction> transaction;
  transactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transaction.isEmpty
            ? Column(
                children: [
                  Text("No Items Found"),
                  SizedBox(),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/one.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView(
                children: transaction.map((tx) {
                  return Card(
                      child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorDark,
                                width: 2)),
                        child: Text(
                          "\$ ${tx.amount.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.brown),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMEd().format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ));
                }).toList(),
              ));
  }
}
