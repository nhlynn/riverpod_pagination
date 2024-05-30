class ImageSearchResult {
  final int? total;
  final int? totalPages;
  final List<ImageResult>? results;

  ImageSearchResult({
    this.total,
    this.totalPages,
    this.results,
  });

  factory ImageSearchResult.fromJson(Map<String, dynamic> json) {
    return ImageSearchResult(
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ImageResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'total_pages': totalPages,
      'results': results?.map((e) => e.toJson()).toList(),
    };
  }
}

class ImageResult {
  final String? id;
  final String? altDescription;
  final ImageUrls? urls;
  final String? createdAt;

  ImageResult({
    this.id,
    this.altDescription,
    this.urls,
    this.createdAt,
  });

  factory ImageResult.fromJson(Map<String, dynamic> json) {
    return ImageResult(
      id: json['id'] as String?,
      altDescription: json['alt_description'] as String?,
      urls: json['urls'] != null
          ? ImageUrls.fromJson(json['urls'] as Map<String, dynamic>)
          : null,
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alt_description': altDescription,
      'urls': urls?.toJson(),
    };
  }
}

class ImageUrls {
  final String? raw;
  final String? full;
  final String? regular;
  final String? small;
  final String? thumb;
  final String? smallS3;

  ImageUrls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  factory ImageUrls.fromJson(Map<String, dynamic> json) {
    return ImageUrls(
      raw: json['raw'] as String?,
      full: json['full'] as String?,
      regular: json['regular'] as String?,
      small: json['small'] as String?,
      thumb: json['thumb'] as String?,
      smallS3: json['small_s3'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'raw': raw,
      'full': full,
      'regular': regular,
      'small': small,
      'thumb': thumb,
      'small_s3': smallS3,
    };
  }
}
