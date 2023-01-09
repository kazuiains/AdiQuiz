import 'package:adi_quiz/domain/entities/question.dart';

abstract class QuizRepository {
  Future<List<Question>> listQuestion(
    String? topic,
  );
}
