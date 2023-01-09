import 'package:adi_quiz/app/core/usecases/param_usecase.dart';
import 'package:adi_quiz/domain/entities/question.dart';
import 'package:adi_quiz/domain/repositories/quiz_repository.dart';

class ListQuestionUseCase extends ParamUseCase<List<Question>, String> {
  final QuizRepository _repo;

  ListQuestionUseCase(
    this._repo,
  );

  @override
  Future<List<Question>> execute(params) async {
    return _repo.listQuestion(params);
  }
}
