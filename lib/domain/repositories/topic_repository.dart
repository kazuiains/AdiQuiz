import 'package:adi_quiz/domain/entities/topic.dart';

abstract class TopicRepository {
  Future<List<Topic>> list();
}
