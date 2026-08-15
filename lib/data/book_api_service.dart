import 'package:dio/dio.dart';
import '../models/book_model.dart';

class BookApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://potterapi-fedeperin.vercel.app',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  Future<List<Book>> fetchBooks() async {
    try {
      final Response response = await _dio.get('/en/books');

      final List<dynamic> data = response.data as List<dynamic>;

      return Book.listFromMaps(data);
    } on DioException catch (e) {
      throw Exception('فشل تحميل الكتب: ${e.message}');
    } catch (e) {
      throw Exception('حصل خطأ غير متوقع: $e');
    }
  }
}
