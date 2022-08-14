import 'package:flutter/material.dart';

import '../screens/random_screen.dart';
import '../screens/unknown_screen.dart';

enum RoutePath {
  home,
  randomScreen,
  unknown;

  String get segmentName => this == RoutePath.home ? '' : name;
  String get location => this == RoutePath.home ? '/' : '/$name';
}

class RouteUtils {
  static RoutePath parseUri(String? location) {
    if (location != null) {
      final uri = Uri.parse(location);
      late RoutePath result;
      if (uri.pathSegments.isEmpty) {
        result = RoutePath.home;
      } else if (uri.pathSegments.first == RoutePath.randomScreen.segmentName) {
        result = RoutePath.randomScreen;
      } else {
        result = RoutePath.unknown;
      }
      return result;
    } else {
      return RoutePath.unknown;
    }
  }

  static RouteInformation restoreRouteInformation(RoutePath path) {
    late RouteInformation result;
    switch (path) {
      case RoutePath.home:
        result = RouteInformation(location: RoutePath.home.location);
        break;
      case RoutePath.randomScreen:
        result = RouteInformation(location: RoutePath.randomScreen.location);
        break;
      case RoutePath.unknown:
        result = RouteInformation(location: RoutePath.unknown.location);
        break;
    }
    return result;
  }

  static MaterialPage? updatePages(RoutePath path) {
    late MaterialPage? newPage;
    switch (path) {
      case RoutePath.home:
        return null;
      case RoutePath.randomScreen:
        newPage = MaterialPage(
          child: const RandomScreen(),
          key: UniqueKey(),
          name: RoutePath.randomScreen.location,
        );
        break;
      case RoutePath.unknown:
        newPage = MaterialPage(
          child: const UnknownScreen(),
          key: UniqueKey(),
          name: RoutePath.unknown.location,
        );
        break;
    }
    return newPage;
  }
}
