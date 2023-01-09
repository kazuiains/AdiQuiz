import 'package:adi_quiz/data/models/topic_models.dart';
import 'package:adi_quiz/data/providers/firestore/firestore_provider.dart';

class TopicCollection {
  final provider = FirestoreProvider.instance;

  Future get({
    String? search,
  }) async {
    try {
      final fireStore = await provider.db;

      final ref = fireStore.collection('topic').withConverter<TopicModel>(
            fromFirestore: (snapshot, _) => TopicModel.fromJson(
              snapshot.data()!,
            ),
            toFirestore: (topic, _) => topic.toJson(),
          );

      return ref.get().then(
        (snapshot) {
          return snapshot.docs;
        },
      );
    } catch (_) {
      rethrow;
    }
  }
}
