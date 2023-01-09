import 'package:adi_quiz/data/models/topic_models.dart';
import 'package:adi_quiz/data/providers/firestore/collection/topic_collection.dart';
import 'package:adi_quiz/domain/repositories/topic_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopicRepositoryImpl extends TopicRepository {
  final collection = TopicCollection();

  @override
  Future<List<TopicModel>> list() async {
    List<TopicModel> response = [];
    List<QueryDocumentSnapshot<TopicModel>> result = await collection.get();

    if (result.isNotEmpty) {
      for (var i in result) {
        response.add(i.data());
      }
    }
    return response;
  }
}
