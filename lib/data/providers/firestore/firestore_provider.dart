import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  static final _singleton = FirestoreProvider();

  static FirestoreProvider get instance => _singleton;

  Future<FirebaseFirestore> get db async {
    FirebaseFirestore store = FirebaseFirestore.instance;

    store.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
    return store;
  }
}
