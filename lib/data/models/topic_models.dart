import 'dart:convert';

import 'package:adi_quiz/domain/entities/topic.dart';

TopicModel topicModelFromJson(String str) =>
    TopicModel.fromJson(json.decode(str));

String topicModelToJson(TopicModel data) => json.encode(data.toJson());

class TopicModel extends Topic {
  TopicModel({
    id,
    name,
  }) : super(
          id: id,
          name: name,
        );

  _initFromEntity(Topic entity) {
    id = entity.id;
    name = entity.name;
  }

  TopicModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as Topic);
    _initFromEntity(dataEntity);
  }

  TopicModel.fromEntity(Topic entity) {
    _initFromEntity(entity);
  }

  TopicModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
