import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final String label;
  final SpendingAmount;
  final SpendingPercentageofTotal;
  BarChart(this.label, this.SpendingAmount, this.SpendingPercentageofTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(child: Text('\$${SpendingAmount.toString()}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20)),
              ),
              FractionallySizedBox(
                heightFactor: SpendingPercentageofTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
