import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ratingBrainProvider = ChangeNotifierProvider.autoDispose<RatingBrain>((ref){
  return RatingBrain();
});

class RatingBrain extends ChangeNotifier {
  static int _rating;
  static List<int> _list_opp = [];
  static double _puntos;
  static int _kFactor;
  static double _ratingChange;

  UnmodifiableListView<int> get listOpponents {
    return UnmodifiableListView(_list_opp);
  }

  int get listOpponentsCount {
    return _list_opp.length;
  }

  void addOpponent(int opponent) {
    _list_opp.add(opponent);
    notifyListeners();
  }

  void deleteOpponent(int opponent) {
    _list_opp.remove(opponent);
    notifyListeners();
  }

  get getPts {
    return _puntos;
  }

  void updatePts(double newPts) {
    _puntos = newPts;
    notifyListeners();
  }

  get getKFactor {
    return _kFactor;
  }

  void updateKFactor(int newK) {
    _kFactor = newK;
    notifyListeners();
  }

  get getRating {
    return _rating;
  }

  void updateRating(int rating) {
    _rating = rating;
    notifyListeners();
  }

  get getRatingChange {
    return _ratingChange;
  }

  void updateNewRating() {
    print('_rating: $_rating');
    if (_rating != null &&
        _rating > 100 &&
        _list_opp.isNotEmpty &&
        _kFactor != null) {
      if (_puntos == null) _puntos = 0;
      _ratingChange = (_puntos - calculateExp()) * _kFactor;
    } else
      _ratingChange = 0;

    print('_ratingChange: $_ratingChange');
    notifyListeners();
  }

  double calculateExp() {
    double expectancia = 0;
    if (_rating != null && _rating > 100 && _list_opp.isNotEmpty) {
      for (int i = 0; i < _list_opp.length; i++) {
        int dif = (_rating - _list_opp[i]);
        double p = ratingChange(dif);

        if (p == -1)
          return -1;
        else
          expectancia = expectancia + p;
      }
    }

    print('expectancia: $expectancia');
    return expectancia;
  }

  double ratingChange(int dif) {
    if (dif >= 400) return 0.92;
    if (dif <= -400) return 0.08;

    for (int i = 0; i < _table.length; i++) {
      if (_table[i] >= dif && _table[i + 1] <= dif) {
        return _data[_table[i + 1]];
      }
    }
    return -1;
  }

  int getAvg() {
    if (_list_opp.isEmpty) return 0;
    var sum = _list_opp.reduce((a, b) => a + b);
    return (sum / _list_opp.length).round();
  }

  //Rp = Ra + dp
  //Ra = Average rating of opponents  +  rating difference 'dp' from the FIDE table
  // (conversion from percentage score 'p' into rating differences 'dp').
  int getPerformance() {}

  // FIDE TABLE

  static Map<int, double> _data = {
    400: 0.92,
    383: 0.91,
    366: 0.9,
    351: 0.89,
    336: 0.88,
    322: 0.87,
    309: 0.86,
    296: 0.85,
    284: 0.84,
    273: 0.83,
    262: 0.82,
    251: 0.81,
    240: 0.8,
    230: 0.79,
    220: 0.78,
    211: 0.77,
    202: 0.76,
    193: 0.75,
    184: 0.74,
    175: 0.73,
    166: 0.72,
    158: 0.71,
    149: 0.7,
    141: 0.69,
    133: 0.68,
    125: 0.67,
    117: 0.66,
    110: 0.65,
    102: 0.64,
    95: 0.63,
    87: 0.62,
    80: 0.61,
    72: 0.6,
    65: 0.59,
    57: 0.58,
    50: 0.57,
    43: 0.56,
    36: 0.55,
    29: 0.54,
    21: 0.53,
    14: 0.52,
    7: 0.51,
    0: 0.5,
    -7: 0.49,
    -14: 0.48,
    -21: 0.47,
    -29: 0.46,
    -36: 0.45,
    -43: 0.44,
    -50: 0.43,
    -57: 0.42,
    -65: 0.41,
    -72: 0.4,
    -80: 0.39,
    -87: 0.38,
    -95: 0.37,
    -102: 0.36,
    -110: 0.35,
    -117: 0.34,
    -125: 0.33,
    -133: 0.32,
    -141: 0.31,
    -149: 0.3,
    -158: 0.29,
    -166: 0.28,
    -175: 0.27,
    -184: 0.26,
    -193: 0.25,
    -202: 0.24,
    -211: 0.23,
    -220: 0.22,
    -230: 0.21,
    -240: 0.2,
    -251: 0.19,
    -262: 0.18,
    -273: 0.17,
    -284: 0.16,
    -296: 0.15,
    -309: 0.14,
    -322: 0.13,
    -336: 0.12,
    -351: 0.11,
    -366: 0.1,
    -383: 0.09,
    -400: 0.08
  };
  List<int> _table = _data.keys.toList();

  var s =
      "1.0: 800	.83:	273	.66:	117	.49:	-7	.32:	 -133	.15:	-296 .99:	677	.82:	262	.65:	110	.48:	-14	.31:	 -141	.14	-309 .98	589	.81	251	.64	102	.47	-21	.30	 -149	.13	-322 .97	538	.80	240	.63	95	.46	-29	.29	 -158	.12	-336 .96	501	.79	230	.62	87	.45	-36	.28	 -166	.11	-351 .95	470	.78	220	.61	80	.44	-43	.27	 -175	.10	-366 .94	444	.77	211	.60	72	.43	-50	.26	 -184	.09	-383 .93	422	.76	202	.59	65	.42	-57	.25	 -193	.08	-401 .92	401	.75	193	.58	57	.41	-65	.24	 -202	.07	-422 .91	383	.74	184	.57	50	.40	-72	.23	 -211	.06	-444 .90	366	.73	175	.56	43	.39	-80	.22	 -220	.05	-470 .89	351	.72	166	.55	36	.38	-87	.21	 -230	.04	-501 .88	336	.71	158	.54	29	.37	-95	.20	 -240	.03	-538 .87	322	.70	149	.53	21	.36	-102	.19	 -251	.02	-589 .86	309	.69	141	.52	14	.35	-110	.18	 -262	.01	-677 .85	296	.68	133	.51	7	.34	-117	.17	 -273	.00	-800 .84	284	.67	125	.50	0	.33	-125	.16	 -284";
}
