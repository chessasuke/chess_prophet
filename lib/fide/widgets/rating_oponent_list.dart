// import 'package:chess_prophet/common/constants/display_properties.dart';
// import 'package:chess_prophet/common/widgets/separator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'opponents_list.dart';

// class RatingOpponentList extends ConsumerWidget {
//   const RatingOpponentList({
//     required this.height,
//     Key? key,
//   }) : super(key: key);

//   final double height;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ScrollController scrollController = ScrollController();

//     return SizedBox(
//       height: height,
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           const Separator(),
//           const SizedBox(height: DisplayProperties.defaultPaddingValue),
//           Expanded(child: OpponentsList(scrollController: scrollController)),
//           const Separator(),
//         ],
//       ),
//     );
//   }
// }
