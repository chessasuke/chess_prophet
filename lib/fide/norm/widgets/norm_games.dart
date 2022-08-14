import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/text/font_weights.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/common/utils/utils.dart';
import 'package:chess_prophet/fide/norm/norm_providers/norm_providers.dart';
import 'package:chess_prophet/fide/utils/fide_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NormGames extends ConsumerWidget {
  const NormGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final normGames = ref.watch(normGamesProvider);

    return Container(
      height: DisplayProperties.componentsHeight,
      width: DisplayProperties.componentsHeight * 1.5,
      decoration: BoxDecoration(
          border: Border.all(
            width: DisplayProperties.componentBorderWidth,
            color: AppColors.black100,
          ),
          borderRadius:
              BorderRadius.circular(DisplayProperties.defaultBorderRadius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => increaseGames(ref),
              child: const Icon(Icons.add),
            ),
          ),
          SizedBox(
            width: Utils.getTextSize('OO', TextStyles.heading02).width,
            child: Center(
              child: Text(
                '$normGames',
                style:
                    TextStyles.heading02.copyWith(fontWeight: FontWeights.normal),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => decreaseGames(ref),
              child: const Icon(Icons.remove),
            ),
          )
        ],
      ),
    );
  }

  void increaseGames(WidgetRef ref) {
    if (ref.read(normGamesProvider) < FideUtils.maxNumberOfGamesForNorm) {
      ref.read(normGamesProvider.notifier).state =
          ref.read(normGamesProvider) + 1;
    }
  }

  void decreaseGames(WidgetRef ref) {
    if (ref.read(normGamesProvider) > FideUtils.minNumberOfGamesForNorm) {
      ref.read(normGamesProvider.notifier).state =
          ref.read(normGamesProvider) - 1;
    }
  }
}
