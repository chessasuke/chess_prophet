import 'package:flutter/material.dart';

class CustomSeparator extends StatelessWidget {
  const CustomSeparator({
    this.h = 1,
    this.w = 130,
    Key key,
  }) : super(key: key);

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 3, top: 0, bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      height: h,
      width: w,
    );
  }
}
