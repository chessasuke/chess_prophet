// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/common/utils/utils.dart';
import 'package:chess_prophet/fide/models/opponent_rating.dart';
import 'package:chess_prophet/fide/norm/norm_providers/norm_providers.dart';
import 'package:chess_prophet/fide/rating/rating_providers/opponents_rating_provider.dart';
import 'package:chess_prophet/fide/rating/rating_providers/rating_providers.dart';
import 'package:chess_prophet/fide/utils/fide_tables.dart';
import 'package:chess_prophet/fide/utils/fide_utils.dart';
import 'package:chess_prophet/fide/widgets/app_tooltip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NormResult extends ConsumerWidget {
  const NormResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opponents = ref.watch(opponentsRatingProvider);
    final userScore = ref.watch(userScoreProvider);
    final games = ref.watch(normGamesProvider);
    final normLevel = ref.watch(normLevelProvider);

    final avg = _getAvg(
        opponents: opponents, userScore: userScore, normLevel: normLevel);
    final Rp = _getRp(opponents: opponents, userScore: userScore);

    final pointsAndAvgMap = _getNormFidePointsAndAvgMap(games);

    return Container(
      constraints:
          const BoxConstraints(minHeight: DisplayProperties.pageResultHeight),
      decoration: BoxDecoration(
        color: AppColors.grayNeutral200,
        borderRadius: BorderRadius.circular(
          DisplayProperties.defaultBorderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DisplayProperties.defaultContentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (avg != null)
                  AppTooltipWidget(
                    text: 'Avg  $avg',
                    message: 'Average Rating of Opponents',
                  ),
                if (Rp != null)
                  AppTooltipWidget(
                    text: 'Rp  $Rp',
                    message: 'Performance Rating',
                  ),
              ],
            ),
            const SizedBox(height: DisplayProperties.defaultContentPadding),
            for (final entry in pointsAndAvgMap.entries)
              Text(
                _getRequiredPointsAndAvg(
                  opponents: opponents,
                  userScore: userScore,
                  games: games,
                  normLevel: normLevel,
                  tableEntry: entry,
                ),
                textAlign: TextAlign.center,
                style: TextStyles.heading03,
              ),
          ],
        ),
      ),
    );
  }

  double? _getAvg({
    required List<OpponentRating> opponents,
    required double userScore,
    required FideTitle normLevel,
  }) {
    final opponentsRating = opponents.map((e) => e.rating).toList();
    if (opponentsRating.isEmpty) {
      return null;
    }
    final avg = FideUtils.calculateAvgForNorm(
      opponentsRating: opponentsRating,
      normLevel: normLevel,
    );
    return avg;
  }

  int? _getRp({
    required List<OpponentRating> opponents,
    required double userScore,
  }) {
    final opponentsRating = opponents.map((e) => e.rating).toList();
    if (opponentsRating.isEmpty) {
      return null;
    }
    final Rp = FideUtils.calculatePerformance(
      ratingOfOpponents: opponentsRating,
      userScore: userScore,
    );
    return Rp;
  }

  String _getRequiredPointsAndAvg({
    required List<OpponentRating> opponents,
    required double userScore,
    required int games,
    required FideTitle normLevel,
    required MapEntry<int, double> tableEntry,
  }) {
    String result = '';

    final opponentsRatings = opponents.map((e) => e.rating).toList();
    final int normLevelFactor = normLevel.normAvgOpponentsDiffFromGM();
    final currentAvg = FideUtils.calculateAvgForNorm(
        opponentsRating: opponentsRatings, normLevel: normLevel);
    final roundsLeft = games - opponents.length;
    final pts = tableEntry.value;
    final minAvg = tableEntry.key - normLevelFactor;

    int sumRatingOpponents = 0;
    for (var opponentRating in opponentsRatings) {
      sumRatingOpponents = sumRatingOpponents + opponentRating;
    }

    final remainingOpponentsAvgNeeded =
        ((games * minAvg - sumRatingOpponents) / roundsLeft);

    if (pts == userScore && currentAvg >= minAvg && opponents.length == games) {
      return 'Congrats ${normLevel.name.toUpperCase()} Norm Achieved!';
    }

    if (pts <= (userScore + roundsLeft) && (pts - userScore) >= 0) {
      result =
          '${result}Need: ${pts - userScore}/$roundsLeft | Avg: ${Utils.roundToNDecimalPlaces(remainingOpponentsAvgNeeded)}\n';
    }
    return result;
  }

  Map<int, double> _getNormFidePointsAndAvgMap(int numOfGames) {
    switch (numOfGames) {
      case 7:
        return FideTables.gmNormPointsRounds7;
      case 8:
        return FideTables.gmNormPointsRounds8;
      case 10:
        return FideTables.gmNormPointsRounds10;
      case 11:
        return FideTables.gmNormPointsRounds11;
      case 12:
        return FideTables.gmNormPointsRounds12;
      case 13:
        return FideTables.gmNormPointsRounds13;
      default:
        return FideTables.gmNormPointsRounds9;
    }
  }
}
