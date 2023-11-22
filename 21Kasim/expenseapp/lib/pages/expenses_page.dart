// import 'package:expenseapp/models/expense.dart';
// import 'package:expenseapp/widgets/expense_item.dart';
// import 'package:flutter/material.dart';

// class ExpensesPage extends StatefulWidget {
//   const ExpensesPage(this.expenses, this.onRemove, {Key? key})
//       : super(key: key);
//   final List<Expense> expenses;
//   final void Function(Expense expense) onRemove;

//   @override
//   _ExpensesPageState createState() => _ExpensesPageState();
// }

// class _ExpensesPageState extends State<ExpensesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         SizedBox(
//           height: 150,
//           child: Text(
//             "Grafik Bölümü",
//             style: Theme.of(context).textTheme.titleLarge,
//           ), // titleLarge stilini alması
//         ),
//         Expanded(
//           child: ListView.builder(
//               itemCount: widget.expenses.length,
//               itemBuilder: (context, index) {
//                 return Dismissible(
//                   key: ValueKey(widget.expenses[index]),
//                   child: ExpenseItem(widget.expenses[index]),
//                   onDismissed: (direction) {

//                     widget.onRemove(widget.expenses[index]);
//                   },
//                 );
//               }),
//         )
//       ]),
//     );
//   }
// }

import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage(this.expenses, this.onRemove, {Key? key})
      : super(key: key);
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            child: Text(
              "Grafik Bölümü",
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(widget.expenses[index]),
                  child: ExpenseItem(widget.expenses[index]),
                  onDismissed: (direction) {
                    Expense removedExpense = widget.expenses[index];

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Item deleted"),
                        action: SnackBarAction(
                          label: "Undo",
                          onPressed: () {
                            setState(() {
                              widget.expenses.insert(index, removedExpense);
                            });
                          },
                        ),
                      ),
                    );
                    widget.onRemove(removedExpense);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}













// // listeden veri silme ve alt başlıkları
// // theming ve alt başlıkları
// // listeden veri silme ve alt başlıkları
// // theming ve alt başlıkları
// //dismissible yana kaydırmak

// // listeden veri silme ve alt başlıkları
// // theming ve alt başlıkları
// //callback ile gelen onRemove metodu
// //  widget.onRemove(widget.expenses[index]);