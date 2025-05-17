import 'package:flutter/material.dart';
import 'package:realview_challenge/core/localization/app_localizations_extension.dart';
import 'package:realview_challenge/domain/enum/author_sort_option.dart';

class SortOptionItem extends StatelessWidget {
  final AuthorSortOption sortOption;
  final bool isSelected;

  const SortOptionItem({
    super.key,
    required this.sortOption,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          sortOption.icon,
          size: 16,
          color: isSelected ? Theme.of(context).colorScheme.primary : null,
        ),
        const SizedBox(width: 8),
        Text(
          sortOption.getLocalizedName(context.l10n),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Theme.of(context).colorScheme.primary : null,
          ),
        ),
      ],
    );
  }
}
