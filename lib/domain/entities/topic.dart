class Topic {
  String? id;
  String? name;

  Topic({
    this.id,
    this.name,
  });

  Topic copyWith({
    String? id,
    String? name,
  }) =>
      Topic(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
