

import 'package:chess_prophet/fide/norm/widgets/norm_page.dart';
import 'package:chess_prophet/fide/rating/widgets/rating_page.dart';
import 'package:chess_prophet/page_manager/widgets/home_page.dart';
import 'package:flutter/material.dart';

enum Pages {
  home,
  rating,
  norm;

  IconData icon() {
    switch (this) {
      case Pages.home:
        return Icons.home;
      case Pages.rating:
        return Icons.insights_outlined;
      case Pages.norm:
        return Icons.article;
    }
  }

  Widget page() {
    switch (this) {
      case Pages.home:
        return const HomePage();
      case Pages.rating:
        return const RatingPage();
      case Pages.norm:
        return const NormPage();
    }
  }
}
