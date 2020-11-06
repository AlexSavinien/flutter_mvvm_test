import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_app/ui/signin/signin_view.dart';
import 'package:flutter_app/ui/signup/signup_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SignInView, initial: true),
    MaterialRoute(page: SignUpView),
  ],
)
class $Router {}