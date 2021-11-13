import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/chart.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transactionList.dart';
import 'package:expense_app/widgets/user_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: "OpenSans",
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //  id: "001",
    //   title: "something",
    //   amount: 900,
    //   date: DateTime.now(),
    //   ),
    //  Transaction(
    //   id: "002",
    //   title: "shirtss",
    //   amount: 900,
    //  date: DateTime.now(),
    // ),
  ];

  void _startAddnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList(); //Add toList() here
  }

  void _addNewTransaction(String title, double amount, DateTime ChosenDate) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: ChosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker App",
          style: TextStyle(fontFamily: 'QuickSand'),
        ),
        actions: [
          IconButton(
              onPressed: () => _startAddnewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Chart(_recentTransactions),
            //  Card(
            //   child: Container(
            //      width: double.infinity,
            //      child: Text("chartt"),
            //     ),
            //   elevation: 5,
            //   ),
            //textfields
            //     userTransactions(),
            transactionList(_userTransaction)
            //textfields
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddnewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
