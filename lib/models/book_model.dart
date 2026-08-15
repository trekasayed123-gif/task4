class Book {
  final int number;
  final String title;
  final int pages;
  final String cover;

  Book({
    required this.number,
    required this.title,
    required this.pages,
    required this.cover,
  });


  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      number: map['number'] ?? 0,
      title: map['title'] ?? '',
      pages: map['pages'] ?? 0,
      cover: map['cover'] ?? '',
    );
  }


  static List<Book> listFromMaps(List<dynamic> mapsList) {
    return mapsList
        .map((item) => Book.fromMap(item as Map<String, dynamic>))
        .toList();
  }
}
