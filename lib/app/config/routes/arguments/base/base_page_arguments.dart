class BasePageArguments<T, S> {
  bool? isSelectedTopic;
  String? topicId;
  double? score;
  T? data;
  S? answer;

  BasePageArguments({
    this.isSelectedTopic,
    this.topicId,
    this.score,
    this.data,
    this.answer,
  });
}
