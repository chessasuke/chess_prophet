import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../logic/rating.dart';
import 'package:flutter/material.dart';
import 'custom_listTile_rating.dart';

class ListViewCustomRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    //only builds the ones that are going to show so more efficient
    return Consumer(
      builder: (context, watch, child) {
        final ratingBrain = watch(ratingBrainProvider);

        return Container(
          width: screenSize.width * 0.5,
          height: screenSize.height * 0.4 - 110,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final opponent = ratingBrain.listOpponents[index];
              return ListTileCustom_rating(
                rating: opponent,
                callback: () {
                  ratingBrain.deleteOpponent(opponent);
                  ratingBrain.updatePts(0);
                  ratingBrain.updateNewRating();
                },
              );
            },
            itemCount: ratingBrain.listOpponentsCount,
          ),
        );
      },
    );
  }
}
