import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension on [BuildContext] to provide easy access to localized strings
extension LocalizationExtension on BuildContext {
  /// Get the [AppLocalizations] instance for the current context
  AppLocalizations get l10n => AppLocalizations.of(this);
}
