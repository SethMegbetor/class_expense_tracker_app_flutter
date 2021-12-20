// ignore_for_file: deprecated_member_use

import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New car',
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Iphone',
      amount: 50,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Planner'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                child: Text('First Card'),
                elevation: 5,
                color: Colors.green,
              ),
            ),
            Card(
              child: Column(children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
                FlatButton(
                  child: const Text('Add Transaction'),
                  textColor: Colors.purple,
                  onPressed: () {},
                )
              ]),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          // '\$${tx.amount}', for the dollar sign
                          'GH₵ ${tx.amount.toStringAsFixed(2)}', //for the GH₵
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            tx.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMMd().format(tx.date),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
