import 'package:expense_application/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 31, 6, 92));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp(
    MaterialApp(

        // utilizziamo il copy with perche così non dobbiamo sovrascrivere tutte le proprietà di stile dell'app, ma solo
        // quelle che ci interessano veramente
        //è molto utile perchè poi potremo accedere in futuro al thema globale e modificarlo partendo da una base prestabilita
        theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer),
            cardTheme: CardTheme(
                color: kColorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColorScheme.primaryContainer)),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 14))),

        // configurazione dark mode
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: CardTheme(
              color: kDarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: const Expenses()),
  );
}
