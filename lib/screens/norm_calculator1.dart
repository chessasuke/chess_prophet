import 'package:chess_prophet/strings/app_strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../custom_widgets/custom_separator.dart';
import '../screens/norm_calculator2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';

class NormCalculator1 extends StatefulWidget {
  static const String id = 'norm_screen1';

  @override
  _NormCalculator1State createState() => _NormCalculator1State();
}

class _NormCalculator1State extends State<NormCalculator1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              TabBar(
                tabs: [
                  Tab(icon: Icon(FontAwesomeIcons.wpforms)),
                  Tab(icon: Icon(Icons.info)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Tab(
                      child: NormCalculator2(),
                    ),
                    Tab(
                      child: SingleChildScrollView(
                        child: Consumer(builder: (context, watch, child) {
                          final lan = watch(lanProvider);
                          return Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  lan.getOpAvg[lan.isES ? 1 : 0],
                                  style: k_textFieldsStyle,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: CustomSeparator(w: 200),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  lan.getOpAvg[lan.isES ? 1 : 0],
                                  style: k_textFieldsStyle,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: CustomSeparator(w: 200),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  lan.getMinAvgOpp[lan.isES ? 1 : 0],
                                  style: k_textFieldsStyle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: CustomSeparator(w: 200),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  lan.getMinPerformance[lan.isES ? 1 : 0],
                                  style: k_textFieldsStyle,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: CustomSeparator(w: 200),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  lan.getMinNumGames[lan.isES ? 1 : 0],
                                  style: k_textFieldsStyle,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: CustomSeparator(w: 200),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  lan.getOpponentsFederation[lan.isES ? 1 : 0],
                                  style: k_textFieldsStyle,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: CustomSeparator(w: 200),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  lan.getOpponentsTitle[lan.isES ? 1 : 0],
                                  style: k_textFieldsStyle,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
