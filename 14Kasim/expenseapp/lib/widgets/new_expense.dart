import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  var _expenseDateController = TextEditingController();
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: _expenseNameController,
            maxLength: 50,
            decoration: InputDecoration(labelText: "Harcama Adı"),
          ),
          TextField(
            controller: _expensePriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Harcama Miktarı"),
          ),
          TextField(
            controller: _expenseDateController,
            decoration: InputDecoration(
                labelText: "Harcama Tarihi", icon: Icon(Icons.calendar_month)),
            onTap: () async {
              final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2022, 11, 14),
                  lastDate: DateTime.now());
              if (dateTime != null) {
                setState(() {
                  _expenseDateController.text =
                      DateFormat("dd.MM.yyyy").format(dateTime);
                });
              }
            },
          ),
          ElevatedButton(
              onPressed: () {
                print(
                    "Kaydedilen girdi: ${_expenseNameController.text} ${_expensePriceController.text} ${_expenseDateController.text}");
              },
              child: Text("Ekle"))
        ]),
      ),
    );
  }
}
/*
 onTap: () async {
              final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2022, 11),
                  lastDate: DateTime.now());
              if (dateTime != null) {
                setState(() {
                  selectedDate = dateTime;
                });
              }
            },
*/