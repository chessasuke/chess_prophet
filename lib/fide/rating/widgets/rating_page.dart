import 'package:chess_prophet/common/constants/display_properties.dart';
import 'package:chess_prophet/fide/rating/widgets/add_opponent_rating.dart';
import 'package:chess_prophet/fide/rating/widgets/add_opponent_rating_btn.dart';
import 'package:chess_prophet/fide/rating/widgets/result_rating.dart';
import 'package:chess_prophet/fide/rating/widgets/user_rating_input.dart';
import 'package:chess_prophet/fide/widgets/slider_score.dart';
import 'package:chess_prophet/fide/rating/widgets/k_factor_dropdown.dart';
import 'package:chess_prophet/fide/widgets/opponents_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingPage extends ConsumerStatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RatingPage> createState() => _RatingScreenState();
}

class _RatingScreenState extends ConsumerState<RatingPage> {

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
              const SizedBox(height: DisplayProperties.defaultContentPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  UserRatingInput(),
                  KFactorDropdown(),
                ],
              ),
              const SizedBox(height: DisplayProperties.defaultContentPadding),
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
              const SizedBox(height: DisplayProperties.defaultContentPadding),
              const ResultRating(),
              const SizedBox(height: DisplayProperties.defaultContentPadding),
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
          (DisplayProperties.componentsHeight * 4) +
          (DisplayProperties.defaultContentPadding * 4));

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
