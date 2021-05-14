import 'package:flutter/material.dart';

class chartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctTotal;
  chartBar(this.label, this.spendingAmount, this.spendingPctTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrains) {
      return Column(
        children: [
          Container(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
          SizedBox(
            height: constrains.maxHeight * 0.05,
          ),
          Container(
            height: constrains.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 200, 1),
                      borderRadius: BorderRadius.circular(40)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(80)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constrains.maxHeight * 0.05,
          ),
          Container(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(child: Text(label)))
        ],
      );
    });
  }
}
