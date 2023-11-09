import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenses = [
    Expense(name: "Yemek", price: 12.0, date: DateTime.now()),
    Expense(name: "Udemy Kurs", price: 200.0, date: DateTime.now()),
    Expense(name: "Yemek", price: 12.0, date: DateTime.now()),
    Expense(name: "Udemy Kurs", price: 200.0, date: DateTime.now()),
    Expense(name: "Yemek", price: 12.0, date: DateTime.now()),
    Expense(name: "Udemy Kurs", price: 200.0, date: DateTime.now()),
    Expense(name: "Yemek", price: 12.0, date: DateTime.now()),
    Expense(name: "Udemy Kurs", price: 200.0, date: DateTime.now()),
    Expense(name: "Yemek", price: 12.0, date: DateTime.now()),
    Expense(name: "Udemy Kurs", price: 200.0, date: DateTime.now()),
    Expense(name: "Yemek", price: 12.0, date: DateTime.now()),
    Expense(name: "Udemy Kurs", price: 200.0, date: DateTime.now()),
    Expense(name: "Yemek", price: 12.0, date: DateTime.now()),
    Expense(name: "Udemy Kurs", price: 200.0, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expence App"),
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_box,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Grafik bölümü",
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return Text(expenses[index].name);
                },
              ),
            ),
            const SizedBox(
              height: 50,
              child: Text("Yeni Bölüm"),
            ),
          ],
        ),
      ),
    );
  }
}









/*
list view sınırlandırılmalı, 
size box ile gibi, 
expended gibi ama expended nereeye verilirse diğerlerden kalan tüm alanı alır. 
instagramda story arama barı arası kaydırma gibi
ve 
scrollDirection: Axis.vertical,
shrinkWrap: true, bu iki kod ile
--


*/