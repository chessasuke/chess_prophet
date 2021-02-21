import 'package:flutter/material.dart';

const k_emailAbout = 'chessiando.cuba@gmail.com';
const k_fbAbout = 'https://www.facebook.com/Chessiando-106808897652188/';
const k_WebsiteAbout = 'http://chessiando.com/';

const k_performanceText = Text('''
GM  Norm: Performance ≥ 2600.
IM  Norm: Performance ≥ 2450. 
WGM Norm: Performance ≥ 2400. 
WIM Norm: Performance ≥ 2250. ''');

const k_avgText = Text('''
GM Norm:  ≥ 2380.
IM Norm:  ≥ 2230.
WGM Norm: ≥ 2180.
WIM Norm: ≥ 2030.''');

const k_gamesText = [
  Text('''
Minimum 9 games (check exceptions in the requirements tab).'''),
  Text('''
Mínimo 9 partidas (ver excepciones en la sección de requisitos).''')
];

const k_printResult2 =
    TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white);

const k_printResult3 = TextStyle(
  color: Colors.white,
  fontSize: 30,
);

const k_boxDecoration_rating = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
  color: Colors.white30,
);

const k_color_water = Color(0xFF254F68);

const List<Color> k_colorList = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.grey,
  Colors.orange,
  Colors.lightBlueAccent,
];

const kInputDecoration = InputDecoration(
  hintStyle: k_textFieldsStyle,
  hintText: 'Enter value',
  fillColor: Colors.white,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

//const k_boxDecorationGradient = BoxDecoration(
//  gradient: LinearGradient(
//    begin: Alignment.topLeft,
//    end: Alignment.bottomRight,
//    stops: [0.1, 0.5, 0.6, 1],
//    colors: [
//      Colors.black54,
//      Color.fromRGBO(97, 117, 106, 1),
//      Color.fromRGBO(82, 105, 85, 1),
//      Colors.black,
//    ],
//  ),
//);

//const k_boxDecorationGradient2 = BoxDecoration(
//  gradient: LinearGradient(
//    begin: Alignment.topRight,
//    end: Alignment.bottomLeft,
//    stops: [0.1, 0.5, 0.6, 1],
//    colors: [
//      Colors.white70,
//      Color.fromRGBO(97, 117, 106, 1),
//      Color.fromRGBO(82, 105, 85, 1),
//      Colors.white,
//    ],
//  ),
//);
//
//const k_questionsDecoration = BoxDecoration(
//  gradient: LinearGradient(
//    colors: [
//      Colors.blue,
//      Colors.blueAccent,
//      Colors.lightBlue,
//      Colors.lightBlueAccent,
//      Colors.white,
//    ],
//    begin: Alignment.topCenter,
//    end: Alignment.bottomRight,
//  ),
//);
//
//const k_gradientAppBar = LinearGradient(
//  begin: Alignment.bottomRight,
//  end: Alignment.topLeft,
//  colors: [
//    Color(0xb3e5fc),
//    Colors.lightBlueAccent,
//    Colors.lightBlue,
//    Colors.blue,
//  ],
//);

const k_textFieldsStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

const k_textStyleSideMenu = TextStyle(
  fontSize: 25,
  color: Colors.white,
);

const k_imgAlt = CircleAvatar(
  child: Icon(
    Icons.person,
  ),
);

const k_imgAlt_Rad50 = CircleAvatar(
  radius: 50,
  child: Icon(
    Icons.person,
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
