import 'package:chess_prophet/custom_widgets/lan_button.dart';
import 'package:chess_prophet/strings/app_strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/about_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constants.dart';
import 'screen_manager.dart';
import 'rating_calculator.dart';
import 'norm_calculator1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: Material(
        color: Colors.blue,
        child: Container(
          color: Theme.of(context).backgroundColor.withOpacity(0.8),
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Consumer(builder: (context, watch, child) {
              final lan = watch(lanProvider);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Hero(
                            tag: 'pic',
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('images/logo1.jpg'),
                            ),
                          ),
                        ),
                      ),
                      Container(width: 50, height: 50, child: LanButton()),
                    ],
                  ),
                  Divider(
                    thickness: 3.0,
                    indent: 25,
                    endIndent: 25,
                  ),
                  GestureDetector(
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.wpforms,
                        color: Colors.white,
                      ),
                      title: Text(
                        lan.getNormCalc[lan.isES ? 1 : 0],
                        style: k_textStyleSideMenu,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScreenManager(child: NormCalculator1())),
                      );
                    },
                  ),
                  GestureDetector(
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.sortNumericUp,
                        color: Colors.white,
                      ),
                      title: Text(
                        lan.getRatingCalc[lan.isES ? 1 : 0],
                        style: k_textStyleSideMenu,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScreenManager(child: RatingCalculator())),
                      );
                    },
                  ),
                  GestureDetector(
                    child: ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        lan.getAbout[lan.isES ? 1 : 0],
                        style: k_textStyleSideMenu,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScreenManager(child: AboutScreen())),
                      );
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
