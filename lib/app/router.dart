import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_app/ui/home/home_view.dart';
import 'package:flutter_app/ui/signin/signin_view.dart';
import 'package:flutter_app/ui/signup/signup_view.dart';
import 'package:flutter_app/ui/startup/startup_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: HomeView),
  ],
)
class $Router {}