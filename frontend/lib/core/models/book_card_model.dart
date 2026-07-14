class BookCardModel {
  final int id;
  final String title;
  final String coverUrl;

  BookCardModel({
    required this.id,
    required this.title,
    required this.coverUrl,
  });

  factory BookCardModel.fromJson(Map<String, dynamic> json) {
    return BookCardModel(
      id: json['id'],
      title: json['title'],
      coverUrl: json['coverUrl'],
    );
  }
}
