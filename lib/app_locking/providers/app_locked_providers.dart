import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firestore/firestore_collection_keys.dart';
import '../firestore/firestore_document_keys.dart';
import '../model/app_locked.dart';
import '../model/app_locked_state.dart';
import 'app_locked_state.dart';

final appLockedReferenceProvider = Provider<DocumentReference<AppLocked>>(
  (ref) {
    final appLockedData = FirebaseFirestore.instance
        .collection(FirestoreCollectionKeys.config)
        .doc(FirestoreDocumentKeys.appLockedService)
        .withConverter<AppLocked>(
          fromFirestore: AppLocked.fromFirestore,
          toFirestore: (model, _) => model.toJson(),
        );
    return appLockedData;
  },
);

final appLockedProviderNotifier =
    StateNotifierProvider.autoDispose<AppLockedStateNotifier, AppLockedState>(
        (ref) {
  final appLockedNotifier = AppLockedStateNotifier(ref);
  ref.onDispose(() async {
    await appLockedNotifier.close();
  });
  ref.maintainState = true;
  return appLockedNotifier;
});
