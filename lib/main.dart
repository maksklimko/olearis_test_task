import 'package:flutter/material.dart';
import 'package:olearis_test_task/config/injector/injector.dart';
import 'package:olearis_test_task/config/navigation/app_router.dart';
import 'package:olearis_test_task/config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      routerConfig: _appRouter.config(),
    );
  }
}
