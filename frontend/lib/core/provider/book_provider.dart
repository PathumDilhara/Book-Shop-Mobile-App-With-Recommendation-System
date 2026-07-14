import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/models/book_card_model.dart';
import 'package:frontend/core/provider/dio_provider.dart';
import 'package:frontend/features/explore/services/api_services.dart';

final bookAPIServiceProvider  = Provider<BookAPIService>((ref){
  final dio = ref.read(dioProvider);
  return BookAPIService(dio: dio);
});

final topRatedBooksProvider = FutureProvider<List<BookCardModel>> ((ref) async {
  final service = ref.read(bookAPIServiceProvider);

  return service.getTopRatedBooks();
});

final genresProvider = FutureProvider<List<String>>((ref)async {
  final service = ref.read(bookAPIServiceProvider);
  return service.getGenres();
});
