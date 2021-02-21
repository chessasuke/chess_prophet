import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lanProvider = ChangeNotifierProvider<AppStrings>((ref) {
  return AppStrings();
});

class AppStrings extends ChangeNotifier {
  AppStrings({this.isES = false});

  bool isES;

  toggleLan() {
    isES = !isES;
    notifyListeners();
  }

  /// ------------- NORM 1 -------------------

  List avgOppNorm = ['Opponent Average', 'Promedio de Oponentes'];
  get getAvgOppNorm => avgOppNorm;

  List numGames = ['Number of Games', 'Número de Partidas'];
  get getNumGames => numGames;

  /// ------------- NORM 2 -------------------

  List requirements = ['REQUIREMENTS', 'REQUISITOS'];

  List opAvg = [
    '''1.46 AVG OPPONENTS:

 Only can be adjusted one opponent rating:

  2200 for GM norm
  2050 for IM norm
  2000 for WGM norm
  1850 for WIM norm''',
    '''1.46 ELO DE OPONENTES:

  Se puede ajustar solo el elo de un oponente hasta:

  Para norma GM   2200
  Para norma IM   2050
  Para norma WGM  2000
  Para norma WIM  1850'''
  ];

  get getOpAvg => opAvg;

  static const List minAvgOpp = [
    '''MINIMUM OPPONENT AVERAGE

GM Norm:  ≥ 2380.
IM  Norm:  ≥ 2230.
WGM Norm: ≥ 2180.
WIM Norm: ≥ 2030.''',
    '''1.47 PROMEDIO MINIMO DE OPONENTES:

GM Norm:  ≥ 2380.
IM  Norm:  ≥ 2230.
WGM Norm: ≥ 2180.
WIM Norm: ≥ 2030.'''
  ];
  get getMinAvgOpp => minAvgOpp;

  List minPerformance = [
    '''1.48 MINIMUM PERFORMANCE:

    GM  Norm: Performance ≥ 2599.5
    IM  Norm: Performance ≥ 2450.5
    WGM Norm: Performance ≥ 2399.5
    WIM Norm: Performance ≥ 2250.5''',
    '''
1.48 PERFORMANCE MINIMO:

GM  Norm: Performance ≥ 2599.5
IM  Norm: Performance ≥ 2450.5 
WGM Norm: Performance ≥ 2399.5 
WIM Norm: Performance ≥ 2250.5 
'''
  ];
  get getMinPerformance => minPerformance;

  List minNumGames = [
    '''
1.41	NUMBER OF GAMES:

1.41a Minimum 9 games (exceptions below)
1.41b	Only 7 games are required in World Team, Club o Continental Team or Club Championships.
Only 8 games are required in World Cup or Women`s World Championship Tournament, (this 8 games counts as 9 games).
1.41c In 9 games tournament with a bye, if the player meets the requirements for the remaining games, counts as a 8 games norm.
              ''',
    '''
1.41	NUMERO DE JUEGOS:

1.41a Mínimo 9 partidas (para excepciones seguir leyendo)
1.41b	Solo 7 juegos son requeridos en World Team, Club o Continental Team o Club Championships.
Solo 8 partidas son requeridas en World Cup o Women`s World Championship Tournament, (estas 8 partidas cuentan como norma de 9 partidas).
1.41c En torneo de 9 rondas en caso de tener un bye, si el jugador cumple todas las condiciones en los juegos restantes cuenta como norma de 8 partidas.
              '''
  ];
  get getMinNumGames => minNumGames;

  List opponentsFederation = [
    '''1.43	OPPONENTS FEDERATION
                                
At least two federations besides the host, (exceptions 1.43a - 1.43e). At least one of the three norm should be achieved by the standard requirements.
1.43a	National Championships.
1.43b	Team National Championships.
1.43c	Zonal and Subzonal Tournaments.
1.43e	Swiss tournaments where in each round at least 20 FIDE rated players participate and don't belong to the host federation, plus they are from at least three different federations and at least 10 are GMs, IMs, WGMs, or WIM.

If any of above exceptions are met (standard requirements):

1.44 Maximum of 3/5 of opponents can be from the host federation, maximum of 2/3 of opponents can be from one federation (round to floor)''',
    '''1.43	FEDERACION DE OPONENTES
                                
Al menos dos federaciones además de la del aplicante, (excepción 1.43a - 1.43e). Al menos una norma debe conseguirse en términos normales.
1.43a	Campeonato Nacional.
1.43b	Campeonatos Nacionales por Equipos.
1.43c	Torneos Zonal y Subzonal.
1.43e	Torneos Suizos donde en cada ronda al menos 20 jugadores con elo FIDE participan, no son de la federación anfitriona, son de al menos 3 federaciones distintas, al menos 10 son GMs, IM, WGM o WIM.

Si no se cumplen ninguna de las condiciones anteriores:
1.44	Máximo 3/5 de los oponentes pueden ser de la federación del aplicante, máximo 2/3 de los oponentes pueden ser de una federación (redondeando al menor).'''
  ];
  get getOpponentsFederation => opponentsFederation;

  List opponentsTitle = [
    '''
1.45	OPPONENTS TITLE
    
1.45a	At least 50% of opponents should hold a title(CM and WCM don't count).
1.45b	For GM norm at least 1/3 of the opponents should be GMs and minimum of 3 GMs.
1.45c	For IM norm at least 1/3 of the opponents should be IMs or GMs and minimum of 3 IMs or GMs.
1.45d	For WGM norm at least 1/3 of the opponents should be WGM, IMs or GMs and minimum of 3 WGMs, IMs or GMs.
1.45e	For WIMs norm at least 1/3 of the opponents should be WIMs, WGM, IMs or GMs and minimum of 3 WIMs, WGMs, IMs or GMs.''',
    '''1.45	TITULO DE OPONENTES
    
1.45a	Al menos 50% de los oponentes deben tener un título, (no cuentan CM y WCM).
1.45b	Para norma de GM al menos 1/3 de los oponentes y un mínimo de 3 deben ser GMs.
1.45c	Para norma de IM al menos 1/3 de los oponentes y un mínimo de 3 deben ser IMs o GMs.
1.45d	Para norma de WGM al menos 1/3 de los oponentes y un mínimo de 3 deben ser WGMs, IMs o GMs.
1.45e	Para norma de WIM al menos 1/3 de los oponentes y un mínimo de 3 deben ser WIMs, WGMs, IMs o GMs.'''
  ];
  get getOpponentsTitle => opponentsTitle;

  /// -------------------- Rating --------------------
  List yourRating = ['Your Rating', 'Su Elo'];
  get getYourRating => yourRating;

  List kCoef = ['Development Coefficient', 'Coeficiente de Desarrollo'];
  get getKCoef => kCoef;

  List addOpp = ['Add Opponents', 'Agregar Oponentes'];
  get getAddOpp => addOpp;

  List points = ['Points', 'Puntos'];
  get getPoints => points;

  List enterValueHint = ['Enter Value', 'Entre Valor'];
  get getEnterValueHint => enterValueHint;

  /// -------------------- Side Menu --------------------

  List about = ['About', 'Conócenos'];
  get getAbout => about;

  List aboutContent1 = [
    'Chess Prophet is a tool to calculate norm possibilities and changes in rating. The app is based on the rules and formulas of the FIDE as of February 20th 2021. Please always double check with official arbiters for any mistakes.',
    'Chess Prophet es una herramienta para calcular posibilidades de normas y cambios en el elo. La aplicación está basada en las reglas y fórmulas de la FIDE vigentes el 20 de Febrero del 2021. Por favor, siempre verifique con un árbitro oficial para evitar errores.'
  ];
  get getAboutContent1 => aboutContent1;

  List aboutContent2 = [
    'Social project to promote chess. Visit the website for more information.',
    'Proyecto social para promover el ajedrez. Visita el sitio web para más información.'
  ];
  get getAboutContent2 => aboutContent2;

  List normCalc = ['Norm Calculator', 'Calculadora de norma'];
  get getNormCalc => normCalc;

  List ratingCalc = ['Rating Calculator', 'Calculadora de elo'];
  get getRatingCalc => ratingCalc;
}
