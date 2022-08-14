import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/fide/models/opponent_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class OpponentRatingListTile extends ConsumerWidget {
  const OpponentRatingListTile({
    required this.opponentRating,
    Key? key,
  }) : super(key: key);

  final OpponentRating opponentRating;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Text(
        '${opponentRating.rating}',
        style: TextStyles.heading03,
      ),
    );
  }
}
