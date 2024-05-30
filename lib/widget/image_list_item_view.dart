import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/model/image_model.dart';
import 'network_image_view.dart';

class ImageListItemView extends StatelessWidget {
  const ImageListItemView({super.key, required this.image});

  final ImageResult image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: InkWell(
        onTap: () {
          context.push('/image_detail', extra: image);
        },
        child: Card(
          elevation: 8,
          child: NetworkImageView(
            imageUrl: image.urls?.small ?? "",
          ),
        ),
      ),
    );
  }
}
