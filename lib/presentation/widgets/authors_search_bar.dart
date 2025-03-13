import 'package:flutter/material.dart';
import 'package:realview_challenge/core/localization/app_localizations_extension.dart';

class AuthorsSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  final VoidCallback onClear;

  const AuthorsSearchBar({
    super.key,
    required TextEditingController searchController,
    required this.onChanged,
    required this.onClear,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _searchController,
      hintText: context.l10n.authorsSearchBarHint,
      leading: const Icon(Icons.search),
      trailing: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _searchController.clear();
            onClear();
          },
        ),
      ],
      onChanged: onChanged,
    );
  }
}
