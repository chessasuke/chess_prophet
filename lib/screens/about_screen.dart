import 'package:chess_prophet/strings/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  static String id = 'about_screen';

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Future<void> _launchFacebook() async {
    if (await canLaunch(k_fbAbout)) {
      await launch(
        k_fbAbout,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $k_fbAbout';
    }
  }

  Future<void> _launchWebsite() async {
    if (await canLaunch(k_WebsiteAbout)) {
      await launch(
        k_WebsiteAbout,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $k_WebsiteAbout';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Consumer(builder: (context, watch, child) {
                  final lan = watch(lanProvider);
                  return RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Chess Prophet\n\n\n',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        TextSpan(
                          text:
                              '${lan.getAboutContent1[lan.isES ? 1 : 0]}\n\n\n',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            'by ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )),
                        WidgetSpan(child: SizedBox(height: 20)),
                        TextSpan(
                          text: 'Chessiando\n\n\n',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        WidgetSpan(child: SizedBox(height: 20)),
                        TextSpan(
                          text: lan.getAboutContent2[lan.isES ? 1 : 0],
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ]));
                }),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: 200,
                    height: 2,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 12, right: 15, top: 10, bottom: 10),
                            child: Icon(
                              FontAwesomeIcons.externalLinkSquareAlt,
                              size: 30,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Text(
                            'chessiando.com',
                            style: k_textFieldsStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        _launchWebsite();
                      },
                    ),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 12, right: 15, top: 10, bottom: 10),
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              size: 30,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Text(
                            'facebook',
                            style: k_textFieldsStyle,
                          ),
                        ],
                      ),
                      onTap: () {
                        _launchFacebook();
                      },
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 11, right: 15, top: 10),
                          child: Icon(
                            Icons.email,
                            size: 33,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          k_emailAbout,
                          style: k_textFieldsStyle,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
