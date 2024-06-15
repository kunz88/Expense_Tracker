import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

// pacchetto per formattare una data
var formatter = DateFormat.yMd();

final uuid = Uuid();



enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};




class Expense {
  Expense(
      {required this.category,
      required this.amount,
      required this.date,
      required this.title})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedData => formatter.format(date);
}


// la classe contenitore per le spese contiene due proprietà 
// la categoria delle spese e la lista delle spese, inoltre ti ritorna la spesa totale
class ExpensesBucket {
  ExpensesBucket({required this.category, required this.expenses});

// overload costruttore per filtrare le spese per categoria
// in questo costruttore dividiamo le spese per categoria filtrandole 
//con una funzione specifica degli array
  ExpensesBucket.forCategory(List<Expense> allExpenses,this.category)
   : expenses = allExpenses.where((expense) => expense.category == category ).toList();


  Category category;
  List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
