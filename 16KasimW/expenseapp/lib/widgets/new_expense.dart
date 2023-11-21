import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addNewExpense});
  final void Function(Expense newExpense) addNewExpense;
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _openDatePicker() async {
    DateTime today = DateTime.now(); // 16.11.2023
    // 2022, 11, 16
    DateTime oneYearAgo = DateTime(today.year - 1, today.month, today.day);

    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate == null ? today : _selectedDate!,
        firstDate: oneYearAgo,
        lastDate: today);
    setState(() {
      _selectedDate = selectedDate;
    });
    print("Merhaba");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _expenseNameController,
                maxLength: 50,
                decoration: InputDecoration(labelText: "Harcama Adı"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    //null veya boşsa return'u yap
                    return "Harcama ismi  belirtiniz...";
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expensePriceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Harcama Miktarı", prefixText: "₺"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Harcama miktarı belirtiniz...";
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () => _openDatePicker(),
                      icon: const Icon(Icons.calendar_month)),
                  // ternary operator
                  Text(
                    _selectedDate == null
                        ? "Tarih Seçiniz"
                        : DateFormat.yMd().format(_selectedDate!),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values.map((category) {
                        return DropdownMenuItem(
                            value: category, child: Text(category.name));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          if (value != null) _selectedCategory = value;
                        });
                      })
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Kapat")),
                  const SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      savedData();
                    },
                    child: Text("Ekle"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void savedData() {
    //newExpense gelen değerlerle okuma
    Expense newExpense = Expense(
        name: _expenseNameController.text,
        price: double.parse(_expensePriceController.text),
        date: _selectedDate!,
        category: _selectedCategory);
    //function ile callback
    widget.addNewExpense(newExpense);
    Navigator.pop(context); //ekle ve çık
  }
}


// showDatePicker(
//         context: context,
//         initialDate: today,
//         firstDate: oneYearAgo,
//         lastDate: today)
// .then((value) {
//   async işlemden cevap ne zaman gelirse bu bloğu çalıştır..
//   print(value);
// });
// async function => await etmek
// nullable
// 14:20
// 15:00
// pairlerdeyiz

// sync => bir satır çalışmasını bitirmeden alt satıra geçemez.
// async => async olan satır sadece tetiklenir kod aşağıya doğru çalışmaya devam eder

/*
expended text field içinde olduğunda daha hatasız oluyor. expended yerine sizebox da olur

IconButton(
                  onPressed: () {
                    _openDatePicker();
                  },
                  yerine
 onPressed: () => _openDatePicker(),

  ---
      showDatePicker(context: context, initialDate: initialDate, firstDate: firstDate, lastDate: lastDate)
initialDate takvim başlayınca gelen değer
firstDate: en eski tarih
lastDate: en geç hangi tarihi yarını seçemesin 1 yıl sonrayı seçemsin
--
DateTime today = DateTime.now();
    DateTime oneYearAgo = DateTime(today.year - 1, today.month, today.day);
    //1.yol
    // showDatePicker(
    //         context: context,
    //         initialDate: today,
    //         firstDate: oneYearAgo,
    //         lastDate: today);
    // .then((value) => print(value) //seçimden sonra alttaki
    //     //işlemleri yapması için uyarı gibi. asenkron görevini tanımlasın istiypruz
//2.yol
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate == null ? today : _selectedDate!,
        firstDate: oneYearAgo,
        lastDate: today);
    setState(() {
      _selectedDate = selectedDate;
    });
    print("");
  }
---
sync
asyn
// sync => bir satır çalışmasını bitirmeden alt satıra geçemez.
    // async => async olan satır sadece tetiklenir kod aşağıya doğru çalışmaya devam eder
---
async için yollar :
1 .then
.then((value) {
    //   async işlemden cevap ne zaman gelirse bu bloğu çalıştır..
    //   print(value);
    // });
2 await ve fonksiyon önüne async yaz
3
*/
