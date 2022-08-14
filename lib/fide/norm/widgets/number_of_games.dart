import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/fide/norm/norm_providers/norm_providers.dart';
import 'package:chess_prophet/fide/utils/fide_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberOfGames extends ConsumerWidget {
  const NumberOfGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfGames = ref.watch(normGamesProvider);

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
                label: '${numberOfGames.round()}',
                value: numberOfGames.roundToDouble(),
                min: FideUtils.minNumberOfGamesForNorm.roundToDouble(),
                max: FideUtils.maxNumberOfGamesForNorm.roundToDouble(),
                onChanged: (newValue) => _onChanged(ref, newValue),
              ),
            ),
          ),
          Text(
            '$numberOfGames',
            style: TextStyles.heading03,
          ),
        ],
      ),
    );
  }

  void _onChanged(WidgetRef ref, double newValue) {
    ref.read(normGamesProvider.notifier).state = newValue.round();
  }
}
