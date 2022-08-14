import 'package:chess_prophet/common/constants/app_colors.dart';
import 'package:chess_prophet/common/text/text_style.dart';
import 'package:flutter/material.dart';

class AppTooltipWidget extends StatelessWidget {
  const AppTooltipWidget({
    required this.message,
        this.text,
    Key? key,
  }) : super(key: key);

  final String message;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tooltip(
            message: message,
            child: const Icon(
              Icons.info,
              color: AppColors.black100,
            )),
        if(text != null)
        Text(
          text!,
          style: TextStyles.heading03,
        ),
      ],
    );
  }
}
