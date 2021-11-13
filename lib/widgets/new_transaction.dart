import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? SelectedDate;
  @override
  Widget build(BuildContext context) {
    void submitData() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0 || SelectedDate == null) {
        return;
      }
      widget.addTx(enteredTitle, enteredAmount, SelectedDate);
      Navigator.of(context).pop();
    }

//date picker
    void _presentDatePicker() {
      //pre defined function by flutter

      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
      ).then((PickedDate) {
        if (PickedDate == null) {
          return;
        }

        setState(() {
          SelectedDate = PickedDate;
        });
      });
    }
//date picker

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(labelText: "title"),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(labelText: "Amount"),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(SelectedDate == null
                      ? "No Date Chosen"
                      : DateFormat.yMd().format(SelectedDate!)),
                  ElevatedButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        "Choose Date ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink)),
                onPressed: () {
                  submitData();
                },
                child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
