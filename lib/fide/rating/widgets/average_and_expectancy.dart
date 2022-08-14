import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/fide/rating/rating_providers/rating_providers.dart';
import 'package:chess_prophet/fide/widgets/app_tooltip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AverageAndExpectancy extends ConsumerWidget {
  const AverageAndExpectancy({
    required this.avg,
    required this.exp,
    Key? key,
  }) : super(key: key);

  final double? avg;
  final double? exp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRating = ref.watch(userRatingProvider);

    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: DisplayProperties.defaultContentPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             if (avg != null)
            AppTooltipWidget(
              text: 'Avg  ${avg ?? ""}',
              message: 'Average Rating of Opponents',
            ),
            if(userRating != null && exp != null)
            AppTooltipWidget(
              text: 'Exp  ${exp ?? ""}',
              message: 'Score Expectancy',
            ),
          ],
        ),
      ),
    );
  }
}
