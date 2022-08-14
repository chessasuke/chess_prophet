import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/common/widgets/basic_text_field.dart';
import 'package:chess_prophet/fide/rating/rating_providers/rating_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddOpponentRating extends ConsumerWidget {
  const AddOpponentRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialValue = ref.watch(opponentRatingToAddProvider);

    return BasicTextField(
      initialValue: '${initialValue ?? ''}',
      width: DisplayProperties.textFieldWidth,
      height: DisplayProperties.componentsHeight,
      autoFocus: false,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textInputType: TextInputType.number,
      onChanged: (value) => _onChanged(ref, value),
      style: TextStyles.heading03,
      labelText: 'Add Opponent',
    );
  }

  void _onChanged(WidgetRef ref, String value) {
    final newOpponentRating = int.tryParse(value);
    if (newOpponentRating != null) {
      if (newOpponentRating > 0) {
        ref.read(opponentRatingToAddProvider.notifier).state =
            newOpponentRating;
      }
    }
  }
}
