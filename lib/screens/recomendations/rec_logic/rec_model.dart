class RecModel {
  final String title;
  final String description;
  final String image;
  RecModel({
    required this.title,
    required this.description,
    required this.image,
  });

  factory RecModel.fromJson(Map<String, dynamic> map) {
    return RecModel(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }
}
