import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/analytics/models/event.dart';
import '../../services/analytics/providers/analytics_provider.dart';

class Utils {
  static Future<void> launchURL(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      debugPrint('error launch $url: $e');
    }
  }

  static trackEvent({
    required Event event,
    required WidgetRef ref,
  }) {
    ref.read(analyticsProvider).trackEvent(event);
  }

static double roundToNDecimalPlaces(double num, [int decimalPlaces = 2]) {
    return ((num * pow(10, decimalPlaces)).round()) / pow(10, decimalPlaces);
  }

static  Size getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

}
