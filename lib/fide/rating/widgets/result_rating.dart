import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/utils/utils.dart';
import 'package:chess_prophet/fide/models/k_factor.dart';
import 'package:chess_prophet/fide/models/opponent_rating.dart';
import 'package:chess_prophet/fide/rating/rating_providers/opponents_rating_provider.dart';
import 'package:chess_prophet/fide/rating/rating_providers/rating_providers.dart';
import 'package:chess_prophet/fide/rating/widgets/average_and_expectancy.dart';
import 'package:chess_prophet/fide/rating/widgets/rating_change_text.dart';
import 'package:chess_prophet/fide/utils/fide_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultRating extends ConsumerWidget {
  const ResultRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opponents = ref.watch(opponentsRatingProvider);
    final userRating = ref.watch(userRatingProvider);
    final userScore = ref.watch(userScoreProvider);
    final kFactor = ref.watch(kFactorProvider);

    return Container(
      height: DisplayProperties.componentsHeight,
      decoration: BoxDecoration(
          color: AppColors.grayNeutral200,
          borderRadius: BorderRadius.circular(
            DisplayProperties.defaultBorderRadius,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          userRating == null
              ? InitialRatingText(
                  initialRating: _getRatingChange(
                    opponents: opponents,
                    userRating: userRating,
                    kFactor: kFactor,
                    userScore: userScore,
                    isInitialRating: true,
                  ),
                )
              : RatingChangeText(
                  userRating: userRating,
                  ratingChange: _getRatingChange(
                    opponents: opponents,
                    userRating: userRating,
                    kFactor: kFactor,
                    userScore: userScore,
                    isInitialRating: false,
                  ),
                ),
          AverageAndExpectancy(
            avg: _getAvg(opponents),
            exp: _getExp(
              opponents: opponents,
              userRating: userRating,
            ),
          ),
        ],
      ),
    );
  }

  double? _getAvg(List<OpponentRating> opponents) {
    return opponents.isNotEmpty
        ? FideUtils.calculateAvg(opponents.map((e) => e.rating).toList())
        : null;
  }

  double? _getExp(
      {required List<OpponentRating> opponents, required int? userRating}) {
    if (opponents.isNotEmpty && userRating != null) {
      final opponentsRating = opponents.map((e) => e.rating);
      double exp = 0.0;
      for (var opponentRating in opponentsRating) {
        exp = exp +
            FideUtils.calculateExpectancy(
                userRating: userRating, opponentRating: opponentRating);
      }
      return Utils.roundToNDecimalPlaces(exp, 2);
    } else {
      return null;
    }
  }

  double? _getRatingChange({
    required List<OpponentRating> opponents,
    required int? userRating,
    required KFactor? kFactor,
    required double? userScore,
    required bool isInitialRating,
  }) {
    bool _canCalculateRatingChange() =>
        opponents.isNotEmpty &&
        userRating != null &&
        kFactor != null &&
        userScore != null;

    bool _canCalculateInitialRating() =>
        opponents.isNotEmpty && userScore != null;

    if (!isInitialRating) {
      if (_canCalculateRatingChange()) {
        final opponentsRating = opponents.map((e) => e.rating).toList();
        return FideUtils.calculateRatingChange(
          ratingOfOpponents: opponentsRating,
          userRating: userRating!,
          kFactor: kFactor!.kInt(),
          userScore: userScore!,
        );
      }
      return null;
    } else {
      if (_canCalculateInitialRating()) {
        final opponentsRating = opponents.map((e) => e.rating).toList();
        return FideUtils.calculateIntialRating(
          ratingOfOpponents: opponentsRating,
          userScore: userScore!,
        );
      }
      return null;
    }
  }
}
