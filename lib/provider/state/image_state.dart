import '../../data/model/image_model.dart';

class ImageState {
  final List<ImageResult> imageList;
  final bool loading;
  final bool maxLoaded;
  final String keyword;
  final int page;
  final String errorMessage;
  final int responseCode;

  ImageState({
    required this.imageList,
    required this.loading,
    required this.maxLoaded,
    required this.keyword,
    required this.page,
    required this.errorMessage,
    required this.responseCode,
  });

  ImageState.initial({
    this.loading = false,
    this.maxLoaded = false,
    this.keyword = 'bird',
    this.page = 1,
    this.errorMessage = '',
    this.responseCode = 200,
  }) : imageList = [];

  ImageState copyWith({
    List<ImageResult>? imageList,
    bool? loading,
    bool? maxLoaded,
    String? keyword,
    int? page,
    String? errorMessage,
    int? responseCode,
  }) {
    return ImageState(
      imageList: imageList ?? this.imageList,
      loading: loading ?? this.loading,
      maxLoaded: maxLoaded ?? this.maxLoaded,
      keyword: keyword ?? this.keyword,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
      responseCode: responseCode ?? this.responseCode,
    );
  }
}
