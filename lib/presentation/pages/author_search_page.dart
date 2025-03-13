import 'package:flutter/material.dart';
import 'package:realview_challenge/core/localization/app_localizations_extension.dart';

class AuthorSearchPage extends StatelessWidget {
  const AuthorSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(context.l10n.appTitle)),
        body: Center(child: Text('Hello World!')),
      );
  }
}