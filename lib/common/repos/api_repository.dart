import 'package:dio/dio.dart';

class ApiRepository {
  final _dio = Dio();

  ApiRepository() {
    _dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer token'
    };
  }
}
