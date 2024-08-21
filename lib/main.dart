import 'package:development/core/di/dependency_injection.dart';
import 'package:development/core/routing/app_router.dart';
import 'package:development/doc_app.dart';
import 'package:development/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setUp();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
