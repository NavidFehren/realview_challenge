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
      extensions: <ThemeExtension<dynamic>>[
        CustomTextStyles(),
      ],
    );
  }
}

class CustomTextStyles extends ThemeExtension<CustomTextStyles> {
  final TextStyle listTileSubtitleStyle;

  CustomTextStyles({
    this.listTileSubtitleStyle = const TextStyle(
      fontSize: 12,
      color: Color.fromARGB(255, 108, 108, 108), 
    ),
  });

  @override
  ThemeExtension<CustomTextStyles> copyWith({
    TextStyle? listTileSubtitleStyle,
  }) {
    return CustomTextStyles(
      listTileSubtitleStyle: listTileSubtitleStyle ?? this.listTileSubtitleStyle,
    );
  }

  @override
  ThemeExtension<CustomTextStyles> lerp(
    covariant ThemeExtension<CustomTextStyles>? other,
    double t,
  ) {
    if (other is! CustomTextStyles) {
      return this;
    }
    
    return CustomTextStyles(
      listTileSubtitleStyle: TextStyle.lerp(
        listTileSubtitleStyle,
        other.listTileSubtitleStyle,
        t,
      )!,
    );
  }
}
