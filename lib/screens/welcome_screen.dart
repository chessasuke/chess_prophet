import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chess_prophet/custom_widgets/custom_paint.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    print(Theme.of(context).brightness);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: AppCustomPaint(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: screenSize.height * 1 / 3 -
                      40, // less 40 which is more or less the fontsize (42)
                  left: screenSize.width * 1 / 2 -
                      150, // less 150 which is the width of the container, so it can be translated to the left
                  child: Container(
                    width: 150,
                    child: Center(
                      child: Text(
                        'Chess',
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 1 / 3 + 62,
                  left: screenSize.width * 1 / 2 -
                      100, // less half its width to translated half way down
                  child: Container(
                    width: 200,
                    child: Center(
                      child: Text(
                        'Prophet',
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 1 / 3 - 25,
                  left: screenSize.width * 1 / 2,
                  child: Container(
                    width: 75,
                    child: Center(
                      child: TyperAnimatedTextKit(
                        text: ['iando'],
                        textStyle: Theme.of(context)
                            .primaryTextTheme
                            .bodyText2
                            .copyWith(color: Colors.green, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 1 / 3 - 48,
                  left: screenSize.width * 1 / 2 - 25,
                  child: Container(
                    width: 50,
                    child: Center(
                      child: Text(
                        'by',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText2
                            .copyWith(color: Colors.green, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
