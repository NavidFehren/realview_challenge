
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Enum representing the available sorting options for authors.
enum AuthorSortOption {
  /// Sort by author name in ascending order
  nameAsc,
  
  /// Sort by author name in descending order
  nameDesc,
  
  /// Sort by authors top work in ascending order
  topWorkAsc,
  
  /// Sort by authors top work in descending order
  topWorkDesc,
  
  /// Sort by authors ratings average in ascending order
  ratingsAverageAsc,

  /// Sort by authors ratings average in descending order
  ratingsAverageDesc;
  
  String getLocalizedName(AppLocalizations localizations) {
    switch (this) {
      case AuthorSortOption.nameAsc:
        return localizations.authorSortOptionNameAsc;
      case AuthorSortOption.nameDesc:
        return localizations.authorSortOptionNameDesc;
      case AuthorSortOption.topWorkAsc:
        return localizations.authorSortOptionTopWorkAsc;
      case AuthorSortOption.topWorkDesc:
        return localizations.authorSortOptionTopWorkDesc;
      case AuthorSortOption.ratingsAverageAsc:
        return localizations.authorSortOptionRatingsAverageAsc;
      case AuthorSortOption.ratingsAverageDesc:
        return localizations.authorSortOptionRatingsAverageDesc;
    }
  }

  /// Returns the icon data associated with the sorting option.
  IconData get icon {
    switch (this) {
      case AuthorSortOption.nameAsc:
      case AuthorSortOption.topWorkAsc:
      case AuthorSortOption.ratingsAverageAsc:
        return Icons.arrow_upward;
      case AuthorSortOption.nameDesc:
      case AuthorSortOption.topWorkDesc:
      case AuthorSortOption.ratingsAverageDesc:
        return Icons.arrow_downward;
    }
  }
}
