import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/fide/models/k_factor.dart';
import 'package:chess_prophet/fide/rating/rating_providers/rating_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KFactorDropdown extends ConsumerWidget {
  const KFactorDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kfactorSelected = ref.watch(kFactorProvider);

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
      child: Center(
        child: DropdownButton<KFactor>(
          isDense: true,
          underline: const SizedBox(),
          hint: Text(
            'K',
            style: TextStyles.heading03.copyWith(
              color: AppColors.grayNeutral500,
            ),
          ),
          value: kfactorSelected,
          enableFeedback: true,
          dropdownColor: AppColors.white100,
          iconEnabledColor: AppColors.grayNeutral500,
          items: [
            for (final item in KFactor.values)
              DropdownMenuItem<KFactor>(
                value: item,
                child: Text(
                  item.kName,
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

  void _onChanged(WidgetRef ref, KFactor? value) {
    if (value != null) {
      if (ref.read(kFactorProvider.notifier).state != value) {
        ref.read(kFactorProvider.notifier).state = value;
      }
    }
  }
}
