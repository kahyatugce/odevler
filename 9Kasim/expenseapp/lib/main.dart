import 'package:expenseapp/pages/expenses_page.dart';
import 'package:flutter/material.dart';
String mainName="Expense App";
void main() {
  runApp(const
    MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
     
        body: const ExpensesPage(),
      ),
    ),
  );
}













//modelleme
/*
uuid uygulama örneği
 Expense expense =
      Expense(name: "harcama1", price: 12.0, date: DateTime.now());
  Expense expense2 =
      Expense(name: "harcama1", price: 12.0, date: DateTime.now());
  Expense expense3 =
      Expense(name: "harcama1", price: 12.0, date: DateTime.now());
  print(expense.id);
  print(expense2.id);
  print(expense3.id);
*/