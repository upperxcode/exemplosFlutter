import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar(this.label, this.value, this.percentage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: constraints.maxHeight * .15,
            child: FittedBox(child: Text(value.toStringAsFixed(2))),
          ),
          SizedBox(height: constraints.maxHeight * .05),
          Container(
            color: Colors.transparent,
            height: constraints.maxHeight * .6,
            width: 10,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                decoration: (BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: const Color.fromRGBO(220, 220, 200, 1),
                  borderRadius: BorderRadius.circular(5),
                )),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                    decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                )),
              )
            ]),
          ),
          SizedBox(height: constraints.maxHeight * .05),
          SizedBox(height: constraints.maxHeight * .15, child: FittedBox(child: Text(label))),
        ],
      ),
    );
  }
}
