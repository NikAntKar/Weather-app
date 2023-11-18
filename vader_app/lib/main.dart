import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/about.dart';
import 'pages/home.dart';

void main() {
  final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        path: '/about',
        pageBuilder: (context, state) {
          return const MaterialPage(child: About());
        },
      ),
    ],
  );
  runApp(MyApp(goRouter: goRouter));
}

class MyApp extends StatelessWidget {
  final GoRouter goRouter;
  const MyApp({Key? key, required this.goRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}
