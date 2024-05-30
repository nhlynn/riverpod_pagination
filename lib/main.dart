import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../view/home_page.dart';
import 'data/model/image_model.dart';
import 'view/image_detail_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Riverpod Pagination',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
              path: '/', builder: (context, routeState) => const HomePage()),
          GoRoute(
              path: '/image_detail',
              builder: (context, routeState) {
                var imageModel = routeState.extra as ImageResult;
                return ImageDetailPage(
                  image: imageModel,
                );
              })
        ],
      ),
    );
  }
}
