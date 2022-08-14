import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/fide/rating/rating_providers/opponents_rating_provider.dart';
import 'package:chess_prophet/fide/rating/rating_providers/rating_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOpponentRatingBtn extends ConsumerWidget {
  const AddOpponentRatingBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: DisplayProperties.componentsHeight,
      width: DisplayProperties.componentsHeight,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(DisplayProperties.defaultBorderRadius),
        border: Border.all(
          width: DisplayProperties.componentBorderWidth,
          color: AppColors.black100,
        ),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.add,
          size: DisplayProperties.iconSize,
          color: AppColors.grayNeutral500,
        ),
        onPressed: () => _onPressed(ref),
      ),
    );
  }

  void _onPressed(WidgetRef ref) {
    final newOpponentRating =
        ref.read(opponentRatingToAddProvider.notifier).state;
    if (newOpponentRating != null && newOpponentRating > 0) {
      ref.read(opponentsRatingProvider.notifier).add(newOpponentRating);
      // if (scrollController.hasClients) {
      //   scrollController.animateTo(
      //     scrollController.position.maxScrollExtent +
      //         32 +
      //         DisplayProperties.defaultPaddingValue,
      //     duration: const Duration(milliseconds: 500),
      //     curve: Curves.easeOut,
      //   );
      // }
    } else {
      print('show snackbar error');
    }
  }
}
