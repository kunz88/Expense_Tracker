import 'package:expense_application/widgets/chart/chart.dart';
import 'package:expense_application/widgets/expenses_list/expenses_list.dart';
import 'package:expense_application/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registreredEspenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 29.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Pizza",
        amount: 10.99,
        date: DateTime.now(),
        category: Category.food)
  ];

  void _openAddExpenseOverload() {
    showModalBottomSheet(
      // aggiunge padding in automatico nel caso che la modal venga 
      // oscurata da parti native del device..
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (modalctx) => NewExpense(addNewExpense));
  }

  void addNewExpense(Expense item) {
    setState(() {
      _registreredEspenses.add(item);
    });
  }

  void removeExpense(Expense item) {
    final expenseIndex = _registreredEspenses.indexOf(item);
    setState(() {
      _registreredEspenses.remove(item);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Expense deleted"),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: 'undu',
            onPressed: () {
              setState(() {
                _registreredEspenses.insert(expenseIndex, item);
              });
            },
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    // permette di salvare la width del device così da utilizzarla in un rendering condizionale
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter ExpenseTracker"), actions: [
        IconButton(onPressed: _openAddExpenseOverload, icon: Icon(Icons.add))
      ]),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registreredEspenses),
                Expanded(
                    child: ExpenseList(_registreredEspenses, removeExpense))
              ],
            )
          : Row(children: [
            // devo wrappare anche chart in un expanded altrimenti Flutter non può renderizzare correttamente la width
              Expanded(child: Chart(expenses: _registreredEspenses)),
              Expanded(child: ExpenseList(_registreredEspenses, removeExpense))
            ]),
    );
  }
}
