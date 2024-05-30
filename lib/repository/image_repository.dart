import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/network/network_service.dart';

final imageRepositoryProvider = StateProvider((ref) {
  final networkHandler = ref.watch(networkHandlerProvider);
  return ImageRepository(networkHandler: networkHandler);
});

class ImageRepository {
  final NetworkService _networkHandler;

  ImageRepository({
    required NetworkService networkHandler,
  }) : _networkHandler = networkHandler;

  Future<Response> getImage(
      {Map<String, dynamic>? param, required String endPoint}) async {
    final response = await _networkHandler.getDioMethod(param, endPoint);
    return response;
  }
}
