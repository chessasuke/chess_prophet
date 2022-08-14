import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:flutter/material.dart';

class RatingChangeText extends StatelessWidget {
  const RatingChangeText({
    required this.ratingChange,
    required this.userRating,
    Key? key,
  }) : super(key: key);

  final double? ratingChange;
  final int? userRating;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ratingChange != null && userRating != null)
                Text(
                  _getRatingChangeText(ratingChange!),
                  style: TextStyles.heading03
                      .copyWith(color: _getColor(ratingChange!)),
                )
              else
                const SizedBox(),
            ],
          ),
          const SizedBox(height: DisplayProperties.defaultContentPadding),
          if (ratingChange != null && userRating != null)
            Row(
              children: [
                Text(
                  '$userRating ',
                  style: TextStyles.heading03
                      .copyWith(color: _getColor(ratingChange!)),
                ),
                Icon(Icons.arrow_forward, color: _getColor(ratingChange!)),
                Text(
                  ' ${userRating! + ratingChange!}',
                  style: TextStyles.heading03
                      .copyWith(color: _getColor(ratingChange!)),
                )
              ],
            )
        ],
      ),
    );
  }

  String _getRatingChangeText(double ratingChange) {
    if (ratingChange == 0) {
      return '0';
    } else if (ratingChange > 0) {
      return '+$ratingChange';
    } else {
      return '$ratingChange';
    }
  }

  Color _getColor(double ratingChange) {
    if (ratingChange >= 0) {
      return AppColors.lightGreenSuccess500;
    } else {
      return AppColors.redError500;
    }
  }
}

class InitialRatingText extends StatelessWidget {
  const InitialRatingText({
    required this.initialRating,
    Key? key,
  }) : super(key: key);

  final double? initialRating;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: DisplayProperties.defaultContentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (initialRating != null && initialRating != 0)
              Text(
                '${initialRating!.round()}',
                style: TextStyles.heading02,
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
