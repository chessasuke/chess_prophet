import 'package:flutter/material.dart';

import '../text/text_style.dart';
import 'app_colors.dart';

class DisplayProperties {
  /// Deafult Main Content Padding
  static const double defaultContentPadding = 16.0;
  static const double mainHorizontalPadding = 20.0;
  static const double mainBottomPadding = 48.0;
  static const double mainTopPadding = 32.0;
  static const double defaultBorderRadius = 8.0;

  static const double iconSize = 35.0;

  static const double bottomNavigationBarHeight = 58;

  static const double componentsHeight = 65;
  static const double componentBorderWidth = 0.5;

  static const double pageResultHeight = 150;

  static const double textFieldWidth = 175;
  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    gapPadding: 1,
    borderSide: const BorderSide(color: AppColors.black100),
    borderRadius: BorderRadius.circular(8),
  );

  static const kFactorTooltipMessages = <String>[
    "once a player's published rating has reached 2400 and remains at that level subsequently, even if the rating drops below 2400.",
    "as long as a player's rating remains under 2400 OR for RAPID and BLITZ ratings all players.",
    " for a player new to the rating list until he has completed events with at least 30 games OR for all players until their 18th birthday, as long as their rating remains under 2300.",
  ];

  // static const defaultPaddingValue = 10.0;

  // static const defaultPadding = EdgeInsets.all(8.0);

  static const profileAvatarRadius = 35.0;

  static const cardsBoxShadow = BoxShadow(
    color: AppColors.grayNeutral300,
    blurRadius: 2.0,
    spreadRadius: 1.0,
  );

  static final ratingInputDecoration = InputDecoration(
    hintStyle: TextStyles.heading03,
    fillColor: Colors.white,
    filled: true,
    focusColor: AppColors.grayNeutral300,
    contentPadding: EdgeInsets.zero,
  );

  static final pagesPadding = const EdgeInsets.only(
    top: DisplayProperties.mainBottomPadding,
    bottom: DisplayProperties.mainBottomPadding,
  ).add(const EdgeInsets.symmetric(
      horizontal: DisplayProperties.mainHorizontalPadding));
}
