import 'package:flutter/material.dart';
import 'package:realview_challenge/core/localization/app_localizations_extension.dart';
import 'package:realview_challenge/domain/enum/author_sort_option.dart';

class SortOptionItem extends StatelessWidget {
  final AuthorSortOption sortOption;

  const SortOptionItem({
    super.key,
    required this.sortOption,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(sortOption.icon, size: 20),
        const SizedBox(width: 8),
        Text(sortOption.getLocalizedName(context.l10n)),
      ],
    );
  }
}