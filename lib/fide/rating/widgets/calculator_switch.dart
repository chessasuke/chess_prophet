// import 'package:chess_prophet/common/constants/app_colors.dart';
// import 'package:chess_prophet/common/constants/display_properties.dart';
// import 'package:chess_prophet/common/text/text_style.dart';
// import 'package:chess_prophet/fide/controllers/common_providers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';


// class RatingCalculatorSwitch extends ConsumerWidget {
//   const RatingCalculatorSwitch({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isInitialRating = ref.watch(isInitialRatingProvider);

//     void toggleSwtich(bool newValue) {
//       ref.read(isInitialRatingProvider.notifier).state = newValue;
//     }

//     return SizedBox(
//       height: 50,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Tooltip(
//                 message:
//                     'Set if you are unrated, to calculate your first rating. The formula to calculate first rating is different than rating change.',
//                 child: Icon(
//                   Icons.info,
//                   color: AppColors.grayNeutral300,
//                 ),
//               ),
//               SizedBox(width: DisplayProperties.defaultPadding.right),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   DefaultTextStyle(
//                     style: TextStyles.heading03.copyWith(color: AppColors.grayNeutral300),
//                     child: isInitialRating
//                         ? const Text('Initial Rating')
//                         : const Text('Rating Change'),
//                   ),
//                   Text(
//                     ' Calculator',
//                     style: TextStyles.heading03.copyWith(
//                       color: AppColors.grayNeutral300,
//                     ),
//                   ),
//                 ],
//               ),
//               Switch.adaptive(
//                 inactiveThumbColor: AppColors.pink,
//                 activeColor: AppColors.pink,
//                 value: isInitialRating,
//                 onChanged: toggleSwtich,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
