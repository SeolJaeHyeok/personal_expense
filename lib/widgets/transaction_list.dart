import 'package:flutter/material.dart';

import 'package:flutter_expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'There is no transaction yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20,),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.purple,
                                width: 3,
                                style: BorderStyle.solid)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat()
                                .add_yMMMd()
                                .format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  elevation: 5,
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
