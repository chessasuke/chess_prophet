import 'package:chess_prophet/fide/utils/fide_tables.dart';

import '../../common/utils/utils.dart';

enum FideTitle {
  gm,
  im,
  wgm,
  wim;

  int normAvgOpponentsDiffFromGM() {
    switch (this) {
      case FideTitle.gm:
        return 0;
      case FideTitle.im:
        return 150;
      case FideTitle.wgm:
        return 200;
      case FideTitle.wim:
        return 350;
    }
  }

  int normRatingFloor() {
    switch (this) {
      case FideTitle.gm:
        return 2200;
      case FideTitle.im:
        return 2050;
      case FideTitle.wgm:
        return 2000;
      case FideTitle.wim:
        return 1850;
    }
  }
}

// FIDE Rating Formulas

class FideUtils {
  static const minNumberOfGamesForNorm = 7;
  static const maxNumberOfGamesForNorm = 13;

  static double calculateAvg(List<int> opponentsRating) {
    if (opponentsRating.isEmpty) return 0;
    int sum = 0;
    for (final item in opponentsRating) {
      sum = sum + item;
    }
    return Utils.roundToNDecimalPlaces(sum / opponentsRating.length, 1);
  }

  static double calculateAvgForNorm(
      {required List<int> opponentsRating, required FideTitle normLevel}) {
    if (opponentsRating.isEmpty) return 0;
    int sum = 0;
    int ratingFloor = normLevel.normRatingFloor();
    final minOpponentRating = opponentsRating
        .reduce((value, element) => value < element ? value : element);

    for (final item in opponentsRating) {
      if (item == minOpponentRating && minOpponentRating < ratingFloor) {
        sum = sum + ratingFloor;
      } else {
        sum = sum + item;
      }
    }
    return Utils.roundToNDecimalPlaces(sum / opponentsRating.length, 1);
  }

// FIDE Rating Change
// D  - rating difference
// PD - score probability
// Delta R = actual score - PD
// Sigma Delta R = sum Delta Rs for period
// Sigma Delta R x K = the Rating Change for Rating Period.
// For each game against a rated player find rating difference D. If more than 400 points difference, is allowed to count once per tournament the greatest difference higher than 400 as if it were 400.
  static double calculateRatingChange({
    required List<int> ratingOfOpponents,
    required int userRating,
    required int kFactor,
    required double userScore,
  }) {
    double exp = 0;
    int highestMoreThan400Index = -1;
    int highestMoreThan400Difference = 0;

    /// antifarm rule (if more than 1 opponents rating difference is higher than 400, the greatest one counts as 400)
    for (int i = 0; i < ratingOfOpponents.length; i++) {
      final diff = userRating - ratingOfOpponents[i];
      if (diff > 400) {
        if (diff > highestMoreThan400Difference) {
          highestMoreThan400Difference = diff;
          highestMoreThan400Index = i;
        }
      }
    }

    for (int i = 0; i < ratingOfOpponents.length; i++) {
      /// apply antifarm rule where needed
      if (highestMoreThan400Index == i) {
        exp = exp +
            calculateExpectancy(
              opponentRating: userRating - 400,
              userRating: userRating,
            );
      } else {
        exp = exp +
            calculateExpectancy(
              opponentRating: ratingOfOpponents[i],
              userRating: userRating,
            );
      }
    }

    final result = Utils.roundToNDecimalPlaces(
        (calculateDeltaR(exp: exp, score: userScore) * kFactor), 2);

    // print(
    //     'exp:$exp |  score: $userScore | kfactor: $kFactor  ratingChange: $result');
    return result;
  }

// Use table 8.1.2 to determine score probability PD for each game
  static double _getPD({
    required int playersRatingDifference,
    required bool isUserRatingHigher,
  }) {
    MapEntry<int, double> selectedEntry =
        FideTables.ratingDiffToScore.entries.first;
    for (final entry in FideTables.ratingDiffToScore.entries) {
      if (playersRatingDifference >= entry.key) {
        selectedEntry = entry;
        break;
      }
    }

    /// if is the higher rated player return PD > 0.50
    if (isUserRatingHigher) {
      return selectedEntry.value;
    }

    /// if is the lower rated player return PD < 0.50
    else {
      return 0.5 - (selectedEntry.value - 0.5);
    }
  }

  static double calculateExpectancy({
    required int userRating,
    required int opponentRating,
  }) {
    final playersRatingDiff = userRating - opponentRating;
    final pd = _getPD(
      playersRatingDifference: playersRatingDiff.abs(),
      isUserRatingHigher: playersRatingDiff >= 0 ? true : false,
    );
    return pd;
  }

  static double calculateDeltaR({
    required double exp,
    required double score,
  }) =>
      (score - exp);

  // 8.2 Determining the initial rating 'Ru' of a player.
// 8.2.1 If an unrated player scores zero in their first event this score is disregarded. Otherwise, their rating is calculated using all their results as in 7.1.4.
// 8.2.2 Ra is the average rating of the player's rated opponents.
// 8.2.3 If the player scores 50%, then Ru = Ra.
// If they score more than 50%, then Ru = Ra + 20 for each half point scored over 50%.
// If they score less than 50%, then  Ru = Ra + dp
// Ru is rounded to the nearest whole number
  static double calculateIntialRating({
    required List<int> ratingOfOpponents,
    required double userScore,
  }) {
    // ignore: non_constant_identifier_names
    double Ru = 0;
    int numberOfRounds = ratingOfOpponents.length;
    double averageRatingOfRatedOpponents = calculateAvg(ratingOfOpponents);

    if (userScore == 0) {
    } else if (userScore == numberOfRounds / 2) {
      Ru = averageRatingOfRatedOpponents;
    } else if (userScore > numberOfRounds / 2) {
      late final int numberOfExtraHalfPoints;
      final pointsAbove50Percent = userScore - (numberOfRounds / 2);
      if (userScore < 1) {
        numberOfExtraHalfPoints = 1;
      } else {
        numberOfExtraHalfPoints = (pointsAbove50Percent * 2).round();
      }
      Ru = averageRatingOfRatedOpponents + (numberOfExtraHalfPoints * 20);
    } else {
      Ru = (averageRatingOfRatedOpponents +
          FideTables.scoreToRatingDiff[
              Utils.roundToNDecimalPlaces(userScore / numberOfRounds, 2)]!);
    }
    return Ru;
  }

  /// Calculation of a Performance Rating (Rp):
  /// Ra = rating average of opponents (see 1.4.7)
  /// dp = rating difference from 1.4.9 below
  /// Rp = Ra + dp
  static int? calculatePerformance({
    required List<int> ratingOfOpponents,
    required double userScore,
  }) {
    if (userScore == 0) {
      return null;
    }

    int numberOfRounds = ratingOfOpponents.length;
    double averageRatingOfRatedOpponents = calculateAvg(ratingOfOpponents);

    return (averageRatingOfRatedOpponents +
            FideTables.scoreToRatingDiff[
                Utils.roundToNDecimalPlaces(userScore / numberOfRounds, 2)]!)
        .round();
  }

  static bool normMinScore({
    required List<int> ratingOfOpponents,
    required double userScore,
  }) =>
      userScore / ratingOfOpponents.length >= 0.35;
}
