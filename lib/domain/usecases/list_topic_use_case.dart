import 'package:adi_quiz/app/core/usecases/no_param_usecase.dart';
import 'package:adi_quiz/domain/entities/topic.dart';
import 'package:adi_quiz/domain/repositories/topic_repository.dart';

class ListTopicUseCase extends NoParamUseCase<List<Topic>> {
  final TopicRepository _repo;

  ListTopicUseCase(
    this._repo,
  );

  @override
  Future<List<Topic>> execute() async {
    return _repo.list();
  }
}
