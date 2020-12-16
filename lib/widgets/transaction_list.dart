import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Center(
              child: Column(children: [
                Container(
                  child: Text(
                    'No Transactions added yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  margin: EdgeInsets.all(10),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ]),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: .2)),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                              // style: TextStyle(color: Theme.of(context).primaryColor),
                            ),
                            Text(
                                DateFormat()
                                    .add_yMEd()
                                    .add_jm()
                                    .format(transactions[index].date), //Date
                                style: TextStyle(color: Colors.grey))
                          ])
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
