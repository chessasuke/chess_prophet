import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/fide/norm/norm_providers/norm_providers.dart';
import 'package:chess_prophet/fide/utils/fide_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NormLevel extends ConsumerWidget {
  const NormLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final normLevel = ref.watch(normLevelProvider);

    return Container(
      height: DisplayProperties.componentsHeight,
      width: DisplayProperties.componentsHeight * 1.5,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(DisplayProperties.defaultBorderRadius),
        border: Border.all(
          width: DisplayProperties.componentBorderWidth,
          color: AppColors.black100,
        ),
      ),
      child: Center(
        child: DropdownButton<FideTitle>(
          isDense: true,
          underline: const SizedBox(),
          value: normLevel,
          enableFeedback: true,
          dropdownColor: AppColors.white100,
          iconEnabledColor: AppColors.grayNeutral500,
          items: [
            for (final item in FideTitle.values)
              DropdownMenuItem<FideTitle>(
                value: item,
                child: Text(
                  item.name.toUpperCase(),
                  style: TextStyles.heading03.copyWith(
                    color: AppColors.grayNeutral500,
                  ),
                ),
              )
          ],
          onChanged: (value) => _onChanged(ref, value),
        ),
      ),
    );
  }

  void _onChanged(WidgetRef ref, FideTitle? value) {
    if (value != null) {
      if (ref.read(normLevelProvider.notifier).state != value) {
        ref.read(normLevelProvider.notifier).state = value;
      }
    }
  }
}
