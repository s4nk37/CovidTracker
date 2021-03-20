import 'package:covid19tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StayHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Center(
        child:  Lottie.asset('lottie/stayhome.json'),
      ),
    );
  }
}
class Hand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Center(
        child:  Lottie.asset('lottie/hand.json'),
      ),
    );
  }
}
