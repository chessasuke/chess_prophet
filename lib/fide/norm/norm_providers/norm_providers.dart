

import 'package:chess_prophet/fide/utils/fide_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final normGamesProvider = StateProvider((ref)=> 9);
final normLevelProvider = StateProvider((ref)=> FideTitle.gm);