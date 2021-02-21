import 'package:chess_prophet/strings/app_strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../custom_widgets/custom_listView_ratingBrain.dart';
import '../logic/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';

class RatingCalculator extends StatefulWidget {
  static const String id = 'rating_screen';

  @override
  _RatingCalculatorState createState() => _RatingCalculatorState();
}

class _RatingCalculatorState extends State<RatingCalculator> {
  int opponent;
  Color colorResult;
  TextEditingController _controller = TextEditingController();

  Text printResult(double ratingUpdate, int currentRating) {
    if (ratingUpdate == 0)
      return Text(
        '0',
        style: k_printResult2,
      );
    return Text(
        '[${ratingUpdate.toStringAsFixed(2)}]-> ${(currentRating + ratingUpdate).toStringAsFixed(2)}',
        style: k_printResult2.copyWith(
            color: ratingUpdate >= 0 ? Colors.white : Colors.redAccent));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer(builder: (context, watch, child) {
      final ratingBrain = watch(ratingBrainProvider);
      final lan = watch(lanProvider);

      return SafeArea(
        child: Container(
          width: screenSize.width * 0.98,
          height: screenSize.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  height: screenSize.width * 0.2,
                  child: Center(
                    child: ratingBrain.getRatingChange != null &&
                            ratingBrain.getRating != null
                        ? printResult(
                            ratingBrain.getRatingChange, ratingBrain.getRating)
                        : Text(
                            '0',
                            style: k_printResult2,
                          ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),

                /// User Rating and K
                child: Container(
                  height: screenSize.height * 0.2,
                  decoration: k_boxDecoration_rating,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: screenSize.width * 0.47,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              lan.getYourRating[lan.isES ? 1 : 0],
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText1,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 50,
                              width: screenSize.width * 0.37,
                              child: TextField(
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  print(value);
                                  if (int.parse(value) >= 0 &&
                                      int.parse(value) < 5000) {
                                    ratingBrain.updateRating(int.parse(value));
                                  }
                                },
                                decoration: kInputDecoration,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.025),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70,
                        ),
                        width: screenSize.width * 0.005,
                        height: screenSize.height * 0.17,
                      ),
                      Container(
                        width: screenSize.width * 0.47,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  lan.getKCoef[lan.isES ? 1 : 0],
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            DropdownButton<String>(
                              hint: Text('  K-Factor'),
                              value: ratingBrain.getKFactor != null
                                  ? ratingBrain.getKFactor.toString()
                                  : null,
                              dropdownColor: Colors.black,
                              items: <String>[
                                '10',
                                '15',
                                '20',
                                '40'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText2,
                                  ),
                                );
                              }).toList(),
                              onChanged: (String value) {
                                ratingBrain.updateKFactor(int.parse(value));
                                ratingBrain.updateNewRating();
                                print(ratingBrain.getKFactor);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  height: screenSize.height * 0.4,
                  decoration: k_boxDecoration_rating,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            '${lan.getAddOpp[lan.isES ? 1 : 0]} (${ratingBrain.listOpponentsCount})',
                            style: Theme.of(context).primaryTextTheme.bodyText1,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          /// Add opponents and opponents list
                          Container(
                            width: screenSize.width * 0.55,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Container(
                                        height: 50,
                                        width: screenSize.width * 0.37,
                                        child: TextField(
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          textAlign: TextAlign.center,
                                          onChanged: (value) {
                                            opponent = int.parse(value);
                                          },
                                          decoration: kInputDecoration,
                                          controller: _controller,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: k_boxDecoration_rating,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.add,
                                              size: 35,
                                            ),
                                            onPressed: () {
                                              print(opponent);
                                              if (opponent != null) {
                                                ratingBrain
                                                    .addOpponent(opponent);
                                                ratingBrain.updateNewRating();
                                                _controller.clear();
                                              }
                                            },
                                          )),
                                    ),
                                  ],
                                ),
                                ListViewCustomRating(),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.025),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70,
                            ),
                            width: screenSize.width * 0.005,
                            height: screenSize.width * 0.35,
                          ),
                          Flexible(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'AVG: ${ratingBrain.getAvg() ?? 0}',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1
                                        .copyWith(fontSize: 18),
                                  ),
                                  Text(
                                    'EXP: ${ratingBrain.calculateExp().toStringAsFixed(2)}',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1
                                        .copyWith(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              /// Points
              Container(
                height: screenSize.width * 0.22,
                decoration: k_boxDecoration_rating,
                child: Column(
                  children: <Widget>[
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.white70,
                        overlayColor: Colors.white60,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 13.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25.0),
                      ),
                      child: Slider(
                        divisions: ratingBrain.listOpponentsCount > 0
                            ? ratingBrain.listOpponentsCount * 2
                            : 1,
                        label: ratingBrain.getPts.toString() ?? 0,
                        value: ratingBrain.getPts ?? 0,
                        min: 0,
                        max: ratingBrain.listOpponentsCount.toDouble() ?? 0,
                        onChanged: (double newValue) {
                          ratingBrain.updatePts(newValue);
                          ratingBrain.updateNewRating();
                        },
                      ),
                    ),
                    Text(
                        '${lan.getPoints[lan.isES ? 1 : 0]}: ${ratingBrain.getPts ?? 0}',
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
