/// FIDE Tables 8.1.1 & 8.1.2
/// FIDE Performance table from https://handbook.fide.com/chapter/B022022
class FideTables {
  /// Cutoffs Points for Norms

  static Map<int, double> gmNormPointsRounds7 = {
    2380: 5.5,
    2442: 5,
    2498: 4.5,
    2550: 4,
    2557: 5,
    2600: 3.5,
    2650: 3,
    2702: 2.5,
  };

  static Map<int, double> gmNormPointsRounds8 = {
    2380: 6.5,
    2407: 6,
    2459: 5.5,
    2505: 5,
    2557: 4.5,
    2600: 4,
    2643: 3.5,
    2687: 3,
  };

  static Map<int, double> gmNormPointsRounds9 = {
    2380: 7,
    2434: 6.5,
    2475: 6,
    2520: 5.5,
    2557: 5,
    2600: 4.5,
    2643: 4,
    2680: 3.5,
  };

  static Map<int, double> gmNormPointsRounds10 = {
    2380: 8,
    2407: 7.5,
    2451: 7,
    2490: 6.5,
    2528: 6,
    2564: 5.5,
    2600: 5,
    2636: 4.5,
    2672: 4,
    2710: 3.5,
  };

  static Map<int, double> gmNormPointsRounds11 = {
    2380: 9,
    2389: 8.5,
    2425: 8,
    2467: 7.5,
    2498: 7,
    2535: 6.5,
    2564: 6,
    2600: 5.5,
    2636: 5,
    2665: 4.5,
    2702: 4,
  };

  static Map<int, double> gmNormPointsRounds12 = {
    2380: 9.5,
    2407: 9,
    2442: 8.5,
    2475: 8,
    2505: 7.5,
    2543: 7,
    2571: 6.5,
    2600: 6,
    2629: 5.5,
    2657: 5,
    2687: 4.5,
  };

  static Map<int, double> gmNormPointsRounds13 = {
    2380: 10.5,
    2389: 10,
    2425: 9.5,
    2459: 9,
    2490: 8.5,
    2513: 8,
    2543: 7.5,
    2571: 7,
    2600: 6.5,
    2629: 6,
    2657: 5.5,
    2687: 5,
  };

  /// Table 8.1.1 converting fractional score 'p' into rating difference
  static Map<double, int> scoreToRatingDiff = {
    1.00: 800,
    0.99: 677,
    0.98: 589,
    0.97: 538,
    0.96: 501,
    0.95: 470,
    0.94: 444,
    0.93: 422,
    0.92: 401,
    0.91: 383,
    0.90: 366,
    0.89: 351,
    0.88: 336,
    0.87: 322,
    0.86: 309,
    0.85: 296,
    0.84: 284,
    0.83: 273,
    0.82: 262,
    0.81: 251,
    0.80: 240,
    0.79: 230,
    0.78: 220,
    0.77: 211,
    0.76: 202,
    0.75: 193,
    0.74: 184,
    0.73: 175,
    0.72: 166,
    0.71: 158,
    0.70: 149,
    0.69: 141,
    0.68: 133,
    0.67: 125,
    0.66: 117,
    0.65: 110,
    0.64: 102,
    0.63: 95,
    0.62: 87,
    0.61: 80,
    0.60: 72,
    0.59: 65,
    0.58: 57,
    0.57: 50,
    0.56: 43,
    0.55: 36,
    0.54: 29,
    0.53: 21,
    0.52: 14,
    0.51: 7,
    0.50: 0,
    0.49: -7,
    0.48: -14,
    0.47: -21,
    0.46: -29,
    0.45: -36,
    0.44: -43,
    0.43: -50,
    0.42: -57,
    0.41: -65,
    0.40: -72,
    0.39: -80,
    0.38: -87,
    0.37: -95,
    0.36: -102,
    0.35: -110,
    0.34: -117,
    0.33: -125,
    0.32: -133,
    0.31: -141,
    0.30: -149,
    0.29: -158,
    0.28: -166,
    0.27: -175,
    0.26: -184,
    0.25: -193,
    0.24: -202,
    0.23: -211,
    0.22: -220,
    0.21: -230,
    0.20: -240,
    0.19: -251,
    0.18: -262,
    0.17: -273,
    0.16: -284,
    0.15: -296,
    0.14: -309,
    0.13: -322,
    0.12: -336,
    0.11: -351,
    0.10: -366,
    0.09: -383,
    0.08: -401,
    0.07: -422,
    0.06: -444,
    0.05: -470,
    0.04: -501,
    0.03: -538,
    0.02: -589,
    0.01: -677,
    0.00: -800,
  };

  /// Table 8.1.2 conversion from rating difference 'D' into scoring probability 'PD'

  static const Map<int, double> ratingDiffToScore = {
    735: 1.0,
    620: 0.99,
    560: 0.98,
    518: 0.97,
    485: 0.96,
    457: 0.95,
    433: 0.94,
    412: 0.93,
    392: 0.92,
    375: 0.91,
    358: 0.90,
    345: 0.89,
    329: 0.88,
    316: 0.87,
    303: 0.86,
    291: 0.85,
    279: 0.84,
    268: 0.83,
    257: 0.82,
    246: 0.81,
    236: 0.80,
    226: 0.79,
    216: 0.78,
    207: 0.77,
    198: 0.76,
    189: 0.75,
    180: 0.74,
    171: 0.73,
    163: 0.72,
    154: 0.71,
    146: 0.70,
    138: 0.69,
    130: 0.68,
    122: 0.67,
    114: 0.66,
    107: 0.65,
    99: 0.64,
    92: 0.63,
    84: 0.62,
    77: 0.61,
    69: 0.60,
    62: 0.59,
    54: 0.58,
    47: 0.57,
    40: 0.56,
    33: 0.55,
    26: 0.54,
    18: 0.53,
    11: 0.52,
    4: 0.51,
    0: 0.50,
  };
}
