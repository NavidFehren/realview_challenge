import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// Here it would be possible to provide a light and a dark theme
@singleton
class AppTheme {
  
  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  }
}
