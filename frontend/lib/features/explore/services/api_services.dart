import 'package:dio/dio.dart';
import 'package:frontend/core/models/book_card_model.dart';

class BookAPIService {
  // Why we use dependency injection instead of creating obj as dio = Dio()
  // if we create obj lke this each time we call a method will create instants
  // each time as Dio instance 1, Dio instance 2, Dio instance 3
  final Dio dio;

  // Constructor
  BookAPIService({required this.dio});

  //<List<BookCardModel>
  Future<List<BookCardModel>> getTopRatedBooks() async {
    try {
      print("### Fetching top-rated books");

      final response = await dio.get("/book/top-rated");

      // response.data is already decoded as a Map<String, dynamic> by Dio
      final data = response.data;

      List<dynamic> booksDict = data['data'];

      List<BookCardModel> books =
          booksDict.map((book) => BookCardModel.fromJson(book)).toList();

      return books;
    } catch (err) {
      throw Exception("Error fetching top rated books : $err");
    }
  }

  Future<List<String>> getGenres()async {
    try{
      print("### Fetching book genres");

      final response = await dio.get("/book/genres");

      // always map dynamic response dat into proper format
      List<String> genres = List<String>.from(response.data['data']);

      return genres;
    } catch (err){
      throw Exception("Error fetching genres : $err");
    }
  }
}
