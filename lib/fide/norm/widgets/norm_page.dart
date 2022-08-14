import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/fide/norm/widgets/norm_level.dart';
import 'package:chess_prophet/fide/norm/widgets/norm_result.dart';
import 'package:chess_prophet/fide/rating/widgets/add_opponent_rating.dart';
import 'package:chess_prophet/fide/rating/widgets/add_opponent_rating_btn.dart';
import 'package:chess_prophet/fide/widgets/slider_score.dart';
import 'package:chess_prophet/fide/widgets/opponents_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'norm_games.dart';

class NormPage extends ConsumerStatefulWidget {
  const NormPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NormPage> createState() => _RatingScreenState();
}

class _RatingScreenState extends ConsumerState<NormPage> {
  late Size screenSize;
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    screenSize = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: DisplayProperties.pagesPadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  AddOpponentRating(),
                  AddOpponentRatingBtn(),
                ],
              ),
              OpponentsList(
                scrollController: scrollController,
                height: _calculateOpponentListHeight(screenSize),
              ),
              const SliderScore(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  NormLevel(),
                  NormGames(),
                ],
              ),
              const SizedBox(height: DisplayProperties.defaultContentPadding),
              const NormResult(),
            ],
          ),
        ),
      ),
    );
  }

  /// screen height minus all components except opponent list
  double _calculateOpponentListHeight(Size screenSize) =>
      screenSize.height -
      (DisplayProperties.mainTopPadding +
          DisplayProperties.mainBottomPadding +
          DisplayProperties.bottomNavigationBarHeight +
          (DisplayProperties.componentsHeight * 3) +
          DisplayProperties.normResultHeight +
          (DisplayProperties.defaultContentPadding));

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
