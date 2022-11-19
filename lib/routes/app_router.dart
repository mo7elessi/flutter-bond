library app_router;

import 'package:auto_route/auto_route.dart';
import 'package:bond/features/auth/presentation/login/login_page.dart';
import 'package:bond/features/home/home_page.dart';
import 'package:bond/routes/guards/auth_guard.dart';
import 'package:flutter/cupertino.dart';

import '../features/auth/presentation/register/register_page.dart';
import '../features/auth/routes.dart';

export 'guards/auth_guard.dart';
export 'observers/navigator_observers.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, guards: [AuthGuard], initial: true),
    ...authRoutes,
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter(AuthGuard authGuard) : super(authGuard: authGuard);
}
