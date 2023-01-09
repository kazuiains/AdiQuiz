import 'package:adi_quiz/data/models/question_model.dart';
import 'package:adi_quiz/data/providers/firestore/collection/quiz_collection.dart';
import 'package:adi_quiz/domain/repositories/quiz_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizRepositoryImpl extends QuizRepository {
  final collection = QuizCollection();

  @override
  Future<List<QuestionModel>> listQuestion(topic) async {
    List<QuestionModel> response = [];
    List<QueryDocumentSnapshot<QuestionModel>> result =
        await collection.getQuestion(
      topic: topic,
    );

    if (result.isNotEmpty) {
      for (var i in result) {
        response.add(i.data());
      }
    }
    return response;
  }
}
