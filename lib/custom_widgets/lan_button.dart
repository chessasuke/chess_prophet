import 'package:chess_prophet/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final lan = watch(lanProvider);
    print(lan.isES ? 'es' : 'en');
    return InkWell(
      onTap: () {
        lan.toggleLan();
      },
      child: Text(
        lan.isES ? 'EN' : 'ES',
        style: TextStyle(
            color: Colors.white70,
            fontSize: Theme.of(context).textTheme.headline5.fontSize),
      ),
    );
  }
}
