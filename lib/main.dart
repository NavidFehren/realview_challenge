import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview_challenge/core/bloc/app_bloc_observer.dart';

void main() {

  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set our custom BloC observer for logging
  Bloc.observer = AppBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
