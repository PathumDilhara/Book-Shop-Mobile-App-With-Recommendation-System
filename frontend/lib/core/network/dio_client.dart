import 'package:dio/dio.dart';
import 'package:frontend/core/network/api_constants.dart';

class DioClient {
  late final Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseUrl,

        connectTimeout: Duration(seconds: 5),

        receiveTimeout: Duration(seconds: 5),

        headers: {"Content-Type": "application/json"},
      ),
    );
  }
}
