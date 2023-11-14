import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  // unnamed argument => default olarak required'dır
  // named argument => belirtmek gerekir
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(expense.name),
          Row(
            children: [
              Text(
                  "₺ ${expense.price.toStringAsFixed(2)}"), // string interpolation
              const Spacer(),
              Text(DateFormat.yMd().format(expense.date)),
            ],
          )
        ]),
      ),
    );
  }
}
// y => year
// M => month
// m => minute
// H => 24lük saat sisteminde saat
// h => 12lik saat sisteminde
// d => day
// s => second
//list widget tasarımı okunabilirlik için burada yapılır build edilir, page de 
//this.expense => default required
/*
 children: [Text("300 TL"), Spacer(), Text("14.11.2023")], 
 spacer : iki veri arasında onlara gerekli olan yerler kadarını bırakır ve arayı kendine alır
*/
/*
DATEFORMAT.
y year
M month
m minute
H 24 lük saat
h 12 lik saat
d day
s second
Text(DateFormat.yMd().format(expense.date)),
bu kod  ile date formatlanarak istediğimiz gibi yazılır bunu yapan intl packet
---
                Text("₺ ${expense.price.toString()}"),
double decimal gibi olanlarda kaç hane dikkate almak için:

*/