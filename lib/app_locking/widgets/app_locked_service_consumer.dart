import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/app_locked_state.dart';
import '../providers/app_locked_providers.dart';
import 'app_locked_screen.dart';

class AppLockedServiceConsumer extends ConsumerWidget {
  const AppLockedServiceConsumer({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLockedState = ref.watch(appLockedProviderNotifier);
    switch (appLockedState) {
      case AppLockedState.maintenanceMode:
        return const AppLockedScreen(
            appLockedState: AppLockedState.maintenanceMode);
      case AppLockedState.upgradeRequired:
        return const AppLockedScreen(
            appLockedState: AppLockedState.upgradeRequired);
      default:
        return child;
    }
  }
}
