import 'package:chess_prophet/fide/models/k_factor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final opponentRatingToAddProvider = StateProvider<int?>((ref) => null);
final userScoreProvider = StateProvider<double>((ref) => 0);
final kFactorProvider = StateProvider<KFactor>((ref) => KFactor.k40);
final userRatingProvider = StateProvider<int?>((ref) => null);
