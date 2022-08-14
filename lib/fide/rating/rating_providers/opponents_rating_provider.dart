import 'package:chess_prophet/fide/models/opponent_rating.dart';
import 'package:chess_prophet/fide/rating/rating_providers/rating_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final opponentsRatingProvider =
    StateNotifierProvider<OpponentRatingList, List<OpponentRating>>((ref) {
  return OpponentRatingList(ref);
});

class OpponentRatingList extends StateNotifier<List<OpponentRating>> {
  OpponentRatingList(this.ref, [List<OpponentRating>? initialList])
      : super(initialList ?? []);

  final Ref ref;

  void add(int rating) {
    state = [
      ...state,
      OpponentRating(
        id: _uuid.v4(),
        rating: rating,
      ),
    ];
  }

  void edit({
    required String id,
    required int rating,
  }) {
    state = [
      for (final item in state)
        if (item.id == id)
          OpponentRating(
            id: item.id,
            rating: rating,
          )
        else
          item,
    ];
  }

  void remove(OpponentRating target) {
    state = state
        .where((opponentRating) => opponentRating.id != target.id)
        .toList();
    // decrease score if is greater than number of games
    if (ref.read(userScoreProvider.notifier).state > state.length) {
      ref.read(userScoreProvider.notifier).state =
          ref.read(userScoreProvider.notifier).state - 1;
    }
  }
}
