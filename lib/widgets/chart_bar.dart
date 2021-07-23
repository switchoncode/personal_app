import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
  final double spendingPcOfTotal;
  ChartBar(this.lable, this.spendingAmount, this.spendingPcOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 70,
          width: 10,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 5),
                color: Color.fromRGBO(220, 220, 220, 220),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
                heightFactor: spendingPcOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ))
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text(lable)
      ],
    );
  }
}
