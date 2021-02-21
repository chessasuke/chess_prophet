import 'package:chess_prophet/strings/app_strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../logic/norm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';
import '../custom_widgets/custom_separator.dart';

class NormCalculator2 extends StatefulWidget {
  static const String id = 'norm_screen2';

  @override
  _NormCalculator2State createState() => _NormCalculator2State();
}

class _NormCalculator2State extends State<NormCalculator2> {
  final TextEditingController _controllerAvg = TextEditingController();
  final TextEditingController _controllerPartidas = TextEditingController();

  Text _printResult(int targetNorm, String error) {
    if (targetNorm == -1) {
      return Text(
        '$error',
        style: k_printResult3,
      );
    }

    if (targetNorm == 1) {
      return Text(
        'WIM NORM',
        style: k_printResult3,
      );
    }

    if (targetNorm == 2) {
      return Text(
        'WGM NORM',
        style: k_printResult3,
      );
    }

    if (targetNorm == 3) {
      return Text(
        'IM NORM',
        style: k_printResult3,
      );
    }

    if (targetNorm == 4) {
      return Text(
        'GM NORM',
        style: k_printResult3,
      );
    } else {
      return Text(
        'RESULT',
        style: k_printResult3,
      );
    }
  }

  Future<void> _showMyDialog(String title, int body, [int lan]) async {
    Text txt;
    if (body == 1)
      txt = k_performanceText;
    else if (body == 2)
      txt = k_avgText;
    else if (body == 3) txt = k_gamesText[lan];

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                txt,
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final normBrain2 = watch(normBrainProvider);
      final lan = watch(lanProvider);

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: _printResult(normBrain2.calculateNorm(),
                            normBrain2.getError ?? ''),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: 0, right: 0, bottom: 30),
                        child: Text(
                          'Rp: ${normBrain2.getPerformance() ?? 0}',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2
                              .copyWith(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: 0, right: 0, bottom: 30),
                        child: IconButton(
                          icon: Icon(Icons.help),
                          onPressed: () {
                            _showMyDialog('Rp: PERFORMANCE', 1);
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomSeparator(
                    w: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          lan.getAvgOppNorm[lan.isES ? 1 : 0],
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 0, right: 0, left: 0),
                        child: IconButton(
                          icon: Icon(Icons.help),
                          onPressed: () {
                            _showMyDialog(
                                'Ra: ${context.read(lanProvider).getAvgOppNorm[lan.isES ? 1 : 0]}',
                                2);
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, bottom: 20, right: 0, left: 0),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: TextField(
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (average) {
                          normBrain2.updateAvg(int.parse(average));
                        },
                        decoration: kInputDecoration.copyWith(hintText: 'Avg'),
                        controller: _controllerAvg,
                      ),
                    ),
                  ),
                  CustomSeparator(
                    w: 300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          lan.getNumGames[lan.isES ? 1 : 0],
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 0, right: 0, left: 0),
                        child: IconButton(
                          icon: Icon(Icons.help),
                          onPressed: () {
                            _showMyDialog(
                                '${context.read(lanProvider).getNumGames[lan.isES ? 1 : 0]}',
                                3,
                                lan.isES ? 1 : 0);
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, bottom: 20, right: 0, left: 0),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: TextField(
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (games) {
                          normBrain2.updatePartidas(int.parse(games));
                        },
                        decoration: kInputDecoration.copyWith(
                            hintText: lan.isES ? 'Partidas' : 'Games'),
                        controller: _controllerPartidas,
                      ),
                    ),
                  ),
                  CustomSeparator(w: 300),
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
                      divisions: normBrain2.getPartidas > 0
                          ? normBrain2.getPartidas * 2
                          : 1,
                      label: normBrain2.getPts.toString(),
                      value: normBrain2.getPts ?? 0,
                      min: 0,
                      max: normBrain2.getPartidas.toDouble(),
                      onChanged: (double newValue) {
                        normBrain2.updatePtos(newValue);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      '${lan.getPoints[lan.isES ? 1 : 0]}: ${normBrain2.getPts ?? 0}',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white30,
              ),
            ),
          ),
        ],
      );
    });
  }
}
