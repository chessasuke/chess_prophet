import 'package:chess_prophet/page_manager/widgets/page_manager.dart';
import 'package:chess_prophet/services/crashlytics/firebase_crashlytics_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void didChangeDependencies() {
    print('height in home: ${MediaQuery.of(context).size.height}');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const PageManager();
  }

  void _logCustomCrash(WidgetRef ref) {
    const exception = 'Custom Test Exception, Catch it and log it!';
    try {
      throw Exception(exception);
    } catch (e, stackTrace) {
      ref.read(crashlyticsProvider).recordError(
            exception: exception,
            stackTrace: stackTrace,
            reason: "Test Crashlytics",
          );
    }
  }
}
