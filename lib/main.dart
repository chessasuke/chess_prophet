import 'dart:async';

import 'package:chess_prophet/services/logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'generated/i18n.dart';
import 'navigator/route_parser.dart';
import 'navigator/router_delegate.dart';

void main() async {
  // debugPrintGestureArenaDiagnostics = true;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.manual,
  //   overlays: [SystemUiOverlay.top],
  // );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  if (!kIsWeb) {
    runZonedGuarded<Future<void>>(() async {
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      runApp(
        ProviderScope(
          observers: [Logger()],
          child: const ChessProphet(),
        ),
      );
    },
        (error, stack) => FirebaseCrashlytics.instance
            .recordError(error, stack, fatal: true));
  } else {
    runApp(
      ProviderScope(
        observers: [Logger()],
        child: const ChessProphet(),
      ),
    );
  }
}

class ChessProphet extends ConsumerStatefulWidget {
  const ChessProphet({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<ChessProphet> {
  late final AppRouterDelegate _routerDelegate;
  late final AppRouteInformationParser _routeInformationParser;

  @override
  void initState() {
    _routerDelegate = AppRouterDelegate(ref.read);
    _routeInformationParser = AppRouteInformationParser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Chess Prophet',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
