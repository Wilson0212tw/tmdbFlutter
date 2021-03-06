import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RateIcon extends StatelessWidget {
  final double rate;
  const RateIcon(this.rate, {Key? key}) : super(key: key);

  Color get rateColor {
    if (rate < 2) {
      return const Color.fromARGB(255, 248, 78, 66);
    } else if (rate < 8) {
      return const Color.fromARGB(255, 249, 222, 47);
    } else {
      return const Color.fromARGB(255, 88, 122, 224);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: CircularPercentIndicator(
        radius: 15.0,
        animation: true,
        animationDuration: 1200,
        lineWidth: 2.0,
        percent: rate / 10,
        center: Text(
          "${(rate * 10).toStringAsFixed(0)}%",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.white),
        ),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: Colors.grey,
        progressColor: rateColor,
      ));
}
