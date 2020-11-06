import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_app/services/navigation_service.dart';
import 'package:hooks_riverpod/all.dart';

import 'app/router.gr.dart';
import 'managers/dialog_manager.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
    GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return navigatorKey;
  });
  await Firebase.initializeApp();
  runApp(
    ProviderScope(child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // navigatorKey: context.read(navigatorKeyProvider),
      onGenerateRoute: Router().onGenerateRoute,
      builder: ExtendedNavigator.builder(
        builder: (context) => DialogManager(
          child: widget,
        ),
        router: Router(),
      ),
    );
  }
}


