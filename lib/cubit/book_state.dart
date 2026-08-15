import '../models/book_model.dart';

abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookSuccess extends BookState {
  final List<Book> books;
  BookSuccess(this.books);
}

class BookError extends BookState {
  final String message;
  BookError(this.message);
}
