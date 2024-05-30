import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/image_model.dart';
import '../provider/state/image_state.dart';
import '../repository/image_repository.dart';

final imageControllerProvider =
    StateNotifierProvider<ImageListController, ImageState>((ref) {
  final repository = ref.watch(imageRepositoryProvider);
  return ImageListController(repository: repository);
});

class ImageListController extends StateNotifier<ImageState> {
  // ImageListController(super.state);

  final ImageRepository _repository;

  ImageListController({
    required ImageRepository repository,
  })  : _repository = repository,
        super(ImageState.initial()) {
    loadImages('bird');
  }

  void loadImages(String searchKeyword) async {
    if (state.maxLoaded) {
      return;
    }
    if (state.loading) {
      return;
    }
    state = state.copyWith(keyword: searchKeyword);
    state = state.copyWith(loading: true);
    try {
      Map<String, String> param = {
        'query': state.keyword,
        'per_page': '30',
        'page': state.page.toString()
      };

      final response =
          await _repository.getImage(param: param, endPoint: '/search/photos');

      state = state.copyWith(responseCode: response.statusCode);

      if (response.statusCode == 200) {
        var imageResult = ImageSearchResult.fromJson(response.data);
        final imageList = imageResult.results;

        if (imageList != null) {
          if (imageList.isEmpty) {
            state = state.copyWith(
                maxLoaded: true,
                loading: false,
                errorMessage: 'No Data Found!');
          }
          state = state.copyWith(
              imageList: [...state.imageList, ...imageList],
              loading: false,
              errorMessage: '',
              page: state.page + 1);
        } else {
          state = state.copyWith(
              loading: false, errorMessage: '${response.statusCode} Error');
        }
      }
    } catch (e) {
      state = state.copyWith(
          loading: false, errorMessage: 'No Internet Connection!');
    }
  }
}
