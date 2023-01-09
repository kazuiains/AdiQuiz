class Question {
  String? answerKey;
  String? image;
  String? no;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? text;

  Question({
    this.answerKey,
    this.image,
    this.no,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.text,
  });

  Question copyWith({
    String? answerKey,
    String? image,
    String? no,
    String? option1,
    String? option2,
    String? option3,
    String? option4,
    String? text,
  }) =>
      Question(
        answerKey: answerKey ?? this.answerKey,
        image: image ?? this.image,
        no: no ?? this.no,
        option1: option1 ?? this.option1,
        option2: option2 ?? this.option2,
        option3: option3 ?? this.option3,
        option4: option4 ?? this.option4,
        text: text ?? this.text,
      );
}
