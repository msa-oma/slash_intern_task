import 'package:flutter/material.dart';
import 'package:slash_intern_task/core/routing/app_router.dart';
import 'package:slash_intern_task/slash_app.dart';

import 'core/di/dependency_injection.dart';

void main() {
  setupGetIt();

  runApp(SlashApp(
    appRouter: AppRouter(),
  ));
}
