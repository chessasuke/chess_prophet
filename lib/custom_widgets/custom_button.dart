import 'package:flutter/material.dart';

// custom button
class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.bottonText, this.onPress, @required this.colour});

  final String bottonText;
  final Function onPress;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 100.0,
          height: 42.0,
          child: Text(
            bottonText,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
