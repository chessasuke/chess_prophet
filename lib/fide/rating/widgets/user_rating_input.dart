import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/common/widgets/basic_text_field.dart';
import 'package:chess_prophet/fide/rating/rating_providers/rating_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRatingInput extends ConsumerWidget {
  const UserRatingInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialValue = ref.watch(userRatingProvider);

    return BasicTextField(
      initialValue: '${initialValue ?? ''}',
      autoFocus: false,
      width: DisplayProperties.textFieldWidth,
      height: DisplayProperties.componentsHeight,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textInputType: TextInputType.number,
      onChanged: (value) => _onChanged(ref, value),
      style: TextStyles.heading03,
      labelText: 'Your Rating',
    );
  }

  void _onChanged(WidgetRef ref, String value) {
    int? newVal = int.tryParse(value);
    newVal == 0 ? newVal = null : newVal;
    ref.read(userRatingProvider.notifier).state = newVal;
  }
}
