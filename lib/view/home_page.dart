import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/image_list_controller.dart';
import '../widget/image_list_item_view.dart';
import '../widget/loading_view.dart';
import '../widget/no_internet_connection_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _imageListScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _imageListScrollController.addListener(() {
      if (_imageListScrollController.position.pixels >=
          _imageListScrollController.position.maxScrollExtent * 0.9) {
        ref.read(imageControllerProvider.notifier).loadImages('bird');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageListState = ref.watch(imageControllerProvider);
    final imageList = imageListState.imageList;

    if (imageList.isEmpty) {
      if (imageListState.loading) {
        return const Scaffold(
          body: Center(
            child: LoadingView(),
          ),
        );
      }
    }

    if (imageListState.errorMessage != '' && imageListState.page == 1) {
      return Scaffold(
        body: Center(
          child: NoInternetConnectionView(
            message: imageListState.errorMessage,
            retry: () {
              ref
                  .read(imageControllerProvider.notifier)
                  .loadImages(imageListState.keyword);
            },
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView.builder(
        controller: _imageListScrollController,
        itemCount: imageList.length + 1,
        itemBuilder: (context, index) {
          if (index == imageList.length) {
            if (imageListState.loading) {
              return const SizedBox(
                height: 100,
                child: Center(
                  child: LoadingView(),
                ),
              );
            }
            if (imageListState.errorMessage != '') {
              return Center(
                child: Text(imageListState.errorMessage),
              );
            }
            return const SizedBox.shrink();
          }
          var imageModel = imageList[index];
          return ImageListItemView(
            image: imageModel,
          );
        },
      ),
    );
  }
}
