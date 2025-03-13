import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview_challenge/core/bloc/app_bloc_observer.dart';
import 'package:realview_challenge/core/di/injection.dart';
import 'package:realview_challenge/core/theme/app_theme.dart';

void main() {

  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  configureDependencies();

  // Set our custom BloC observer for logging
  Bloc.observer = AppBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getIt<AppTheme>().theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Book Author App'),
        ), 
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
