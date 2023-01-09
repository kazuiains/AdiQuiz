import 'dart:convert';

import 'package:adi_quiz/domain/entities/question.dart';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel extends Question {
  QuestionModel({
    answerKey,
    image,
    no,
    option1,
    option2,
    option3,
    option4,
    text,
  }) : super(
          answerKey: answerKey,
          image: image,
          no: no,
          option1: option1,
          option2: option2,
          option3: option3,
          option4: option4,
          text: text,
        );

  _initFromEntity(Question entity) {
    answerKey = entity.answerKey;
    image = entity.image;
    no = entity.no;
    option1 = entity.option1;
    option2 = entity.option2;
    option3 = entity.option3;
    option4 = entity.option4;
    text = entity.text;
  }

  QuestionModel.fromDynamic(dynamic dynamicEntity) {
    var dataEntity = (dynamicEntity as Question);
    _initFromEntity(dataEntity);
  }

  QuestionModel.fromEntity(Question entity) {
    _initFromEntity(entity);
  }

  QuestionModel.fromJson(dynamic json) {
    answerKey = json['answer_key'];
    image = json['image'];
    no = json['no'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answerKey != null) {
      map['answer_key'] = answerKey;
    }
    if (image != null) {
      map['image'] = image;
    }
    if (no != null) {
      map['no'] = no;
    }
    if (option1 != null) {
      map['option1'] = option1;
    }
    if (option2 != null) {
      map['option2'] = option2;
    }
    if (option3 != null) {
      map['option3'] = option3;
    }
    if (option4 != null) {
      map['option4'] = option4;
    }
    if (text != null) {
      map['text'] = text;
    }
    return map;
  }
}
