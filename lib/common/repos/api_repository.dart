import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRepository {
  final _dio = Dio();

  ApiRepository() {
    _dio.options.baseUrl = dotenv.env['API_HOST']!;

    _dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer token'
    };
  }
}
