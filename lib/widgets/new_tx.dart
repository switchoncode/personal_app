import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTX extends StatefulWidget {
  final Function addTx;

  NewTX(this.addTx);

  @override
  _NewTXState createState() => _NewTXState();
}

class _NewTXState extends State<NewTX> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enterdTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enterdTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return;
    }

    widget.addTx(
      _titleController.text,
      double.parse(_amountController.text),
      _selectDate,
    );

    Navigator.of(context).pop();
  }

  void _percentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   amountInput = val;
              // }
            ),
            Container(
              height: 90,
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(
                    _selectDate == null
                        ? 'No Date chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectDate)}',
                  ),
                ),
                FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _percentDatePicker)
              ]),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
