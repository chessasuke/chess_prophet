import 'package:flutter/material.dart';
import '../constants.dart';

class ListTileCustom_rating extends StatelessWidget {
  final int rating;
  final Function callback;
  final title;

  ListTileCustom_rating(
      {@required this.rating, @required this.callback, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: title != null
          ? Container(
              child: title,
              width: 35,
              height: 35,
            )
          : null,
      title: Text(
        '$rating',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
      trailing: Container(
        height: 35,
        width: 35,
        decoration: k_boxDecoration_rating,
        child: IconButton(
          icon: Icon(
            Icons.remove,
            size: 22,
          ),
          onPressed: callback,
        ),
      ),
    );
  }
}
