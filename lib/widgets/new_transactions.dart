import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();
  DateTime selectedDate;
  final amountcontroller = TextEditingController();

  void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, selectedDate);
    Navigator.of(context).pop();
  }

  void datepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        selectedDate = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titlecontroller,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) {
              //title = val;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => amount = val,
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Text(selectedDate == null
                      ? 'no date choosen'
                      : DateFormat.yMd().format(selectedDate)),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'choose date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: datepicker),
                ],
              ),
            ),
            RaisedButton(
                onPressed: submitData,
                //print(amount);
                //print(title);
                //print(titlecontroller.text);
                //print(amountcontroller.text);
                color: Colors.purple,
                child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
