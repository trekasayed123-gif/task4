import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/book_api_service.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  final BookApiService _apiService;

  BookCubit(this._apiService) : super(BookInitial());

  Future<void> getBooks() async {
    emit(BookLoading());
    try {
      final books = await _apiService.fetchBooks();
      emit(BookSuccess(books));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }
}
