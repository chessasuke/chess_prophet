import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navigator/navigation_manager.dart';

class RandomScreen extends ConsumerWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'RandomScreen',
                style: TextStyle(),
              ),
              TextButton(
                onPressed: () =>
                    ref.read(navigationManagerProvider).resetToHome(),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
