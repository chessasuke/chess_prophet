import 'package:chess_prophet/app_locking/widgets/app_locked_service_consumer.dart';
import 'package:chess_prophet/page_manager/widgets/page_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const AppLockedServiceConsumer(child: PageManager());
  }

  // void _logCustomCrash(WidgetRef ref) {
  //   const exception = 'Custom Test Exception, Catch it and log it!';
  //   try {
  //     throw Exception(exception);
  //   } catch (e, stackTrace) {
  //     ref.read(crashlyticsProvider).recordError(
  //           exception: exception,
  //           stackTrace: stackTrace,
  //           reason: "Test Crashlytics",
  //         );
  //   }
  // }
}
