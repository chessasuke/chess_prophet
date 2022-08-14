import 'package:equatable/equatable.dart';

/// A read-only rating opponent
class OpponentRating implements Equatable {
  const OpponentRating({
    required this.rating,
    required this.id,
  });

  final String id;
  final int rating;

  OpponentRating copyWith({
    String? id,
    int? rating,
  }) =>
      OpponentRating(
        rating: rating ?? this.rating,
        id: id ?? this.id,
      );

  @override
  List<Object?> get props => [id, rating];

  @override
  bool? get stringify => true;
}
