import 'package:adi_quiz/data/models/question_model.dart';
import 'package:adi_quiz/data/providers/firestore/firestore_provider.dart';

class QuizCollection {
  final provider = FirestoreProvider.instance;

  Future getQuestion({
    String? topic,
  }) async {
    try {
      final fireStore = await provider.db;

      final ref = fireStore
          .collection('quiz')
          .doc('question')
          .collection(topic ?? "")
          .withConverter<QuestionModel>(
            fromFirestore: (snapshot, _) => QuestionModel.fromJson(
              snapshot.data()!,
            ),
            toFirestore: (question, _) => question.toJson(),
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
