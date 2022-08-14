import 'package:chess_prophet/common/text/text_style.dart';
import 'package:chess_prophet/fide/models/opponent_rating.dart';
import 'package:chess_prophet/fide/rating/rating_providers/opponents_rating_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OpponentsList extends ConsumerWidget {
  const OpponentsList({
    required this.height,
    this.scrollController,
    Key? key,
  }) : super(key: key);

  final ScrollController? scrollController;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opponentRatingList = ref.watch(opponentsRatingProvider);

    return SizedBox(
      height: height,
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final opponent = opponentRatingList[index];
          return Dismissible(
            onDismissed: (_) => _onTap(ref, opponent),
            key: ValueKey(opponent.id),
            child: ListTile(
              leading: Text(
                '${index + 1}.',
                style: TextStyles.heading03,
              ),
              title: Text(
                '${opponent.rating}',
                style: TextStyles.heading03,
              ),
              trailing: GestureDetector(
                  onTap: () => _onTap(ref, opponent),
                  child: const Icon(Icons.remove)),
            ),
          );
        },
        itemCount: opponentRatingList.length,
      ),
    );
  }

  void _onTap(WidgetRef ref, OpponentRating opponentRating) {
    ref.read(opponentsRatingProvider.notifier).remove(opponentRating);
  }
}
