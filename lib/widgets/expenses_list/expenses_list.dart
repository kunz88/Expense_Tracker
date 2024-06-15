import 'package:expense_application/models/expense.dart';
import 'package:expense_application/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(this.expenses, this.onRemoveExpense, {super.key});

  final void Function(Expense item) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
        child: Text("No content to show, please insert some expense"));
    if (expenses.isNotEmpty) {
      mainContent = ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) => Dismissible(
              background: Container(color: Theme.of(context).colorScheme.error,
              margin: Theme.of(context).cardTheme.margin,
              ),
              
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              }, // permette di eliminare l'appunto sulle spese anche dalla List
              key: ValueKey(expenses[index]),
              child: ExpenseItem(expenses[index])));
    }

    return mainContent;
  }
}
