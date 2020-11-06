import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';


final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});


class NavigationService {
  // ignore: top_level_function_literal_block
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

