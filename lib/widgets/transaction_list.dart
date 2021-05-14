import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    "NO Transcation",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'images/image/image/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deletetx(transactions[index].id)),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: (BoxDecoration(
                //             border: Border.all(
                //                 color: Theme.of(context).primaryColorDark))),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 30,
                //               color: Theme.of(context).primaryColorLight),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.title,
                //           ),
                //           Text(
                //             DateFormat('yyyy-MM-dd')
                //                 .format(transactions[index].date),
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
