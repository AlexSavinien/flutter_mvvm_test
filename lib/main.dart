import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:hooks_riverpod/all.dart';
import 'app/router.gr.dart';
import 'services/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stacked Riverpod',
      navigatorKey: context.read(navigationServiceProvider).navigatorKey,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
