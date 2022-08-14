import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/fide/rating/rating_providers/opponents_rating_provider.dart';
import 'package:chess_prophet/fide/rating/rating_providers/rating_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderScore extends ConsumerWidget {
  const SliderScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesCount =
        ref.watch(opponentsRatingProvider.select((list) => list.length));
    final points = ref.watch(userScoreProvider);

    return SizedBox(
      height: DisplayProperties.componentsHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: AppColors.grayNeutral300,
                activeTrackColor: AppColors.pink,
                thumbColor: Colors.white70,
                overlayColor: Colors.white60,
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 13.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 25.0),
              ),
              child: Slider.adaptive(
                divisions: gamesCount > 0 ? (gamesCount * 2) : 1,
                label: '$points',
                value: points,
                min: 0,
                max: gamesCount.toDouble(),
                onChanged: (double newValue) {
                  ref.read(userScoreProvider.notifier).state = newValue;
                },
              ),
            ),
          ),
          Text(
            '$points',
            style: TextStyles.heading03,
          ),
        ],
      ),
    );
  }
}
