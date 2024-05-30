import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkHandlerProvider = StateProvider((ref) => NetworkService());

class NetworkService {
  final myDio = Dio(BaseOptions(
      baseUrl: 'https://api.unsplash.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Authorization': 'Client-ID TLri7glOpT7lEDbyuKe-a-3IlZEE-rS70Bo_lxxMe08'
      }));

  Future<Response> getDioMethod(
      Map<String, dynamic>? param, String endPoint) async {
    final response = await myDio.get(endPoint, queryParameters: param);
    return response;
  }
}
