import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TxList extends StatelessWidget {
  final List<Transaction> tx;
  final Function deleteTx;
  TxList(this.tx, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: tx.isEmpty
          ? Column(children: <Widget>[
              Text(
                'No Transaction Added Yet !',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/img/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 10,
                      child: FittedBox(child: Text('\$${tx[index].amount}')),
                    ),
                    title: Text(
                      tx[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(tx[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(tx[index].id),
                    ),
                  ),
                );
              },
              itemCount: tx.length,
            ),
    );
  }
}
