import 'dart:math';

import 'package:adi_quiz/app/core/usecases/param_usecase.dart';
import 'package:adi_quiz/domain/entities/question.dart';
import 'package:adi_quiz/domain/entities/topic.dart';
import 'package:adi_quiz/domain/repositories/quiz_repository.dart';
import 'package:adi_quiz/domain/repositories/topic_repository.dart';

class ListQuestionUseCase extends ParamUseCase<List<Question>, String?> {
  final QuizRepository repo;
  final TopicRepository topicRepo;

  ListQuestionUseCase({
    required this.repo,
    required this.topicRepo,
  });

  @override
  Future<List<Question>> execute(params) async {
    if (params != null) {
      return repo.listQuestion(params);
    } else {
      List<Topic> topics = await topicRepo.list();
      Topic? selected;

      if (topics.isNotEmpty) {
        final random = Random();
        selected = topics[random.nextInt(topics.length)];
        return repo.listQuestion(selected.id);
      }
      return [];
    }
  }
}
