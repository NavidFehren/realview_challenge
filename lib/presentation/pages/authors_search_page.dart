import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview_challenge/core/di/injection.dart';
import 'package:realview_challenge/core/enum/view_state.dart';
import 'package:realview_challenge/core/localization/app_localizations_extension.dart';
import 'package:realview_challenge/domain/enum/author_sort_option.dart';
import 'package:realview_challenge/presentation/cubits/authors_cubit.dart';
import 'package:realview_challenge/presentation/widgets/authors_list.dart';
import 'package:realview_challenge/presentation/widgets/authors_search_bar.dart';
import 'package:realview_challenge/presentation/widgets/sort_option_item.dart';

class AuthorsSearchPage extends StatelessWidget {
  const AuthorsSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthorsCubit>(),
      child: const _AuthorsSearchPageContent(),
    );
  }
}

class _AuthorsSearchPageContent extends StatefulWidget {
  const _AuthorsSearchPageContent();

  @override
  State<_AuthorsSearchPageContent> createState() =>
      _AuthorsSearchPageContentState();
}

class _AuthorsSearchPageContentState extends State<_AuthorsSearchPageContent> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [
          PopupMenuButton<AuthorSortOption>(
            onSelected: (sortOption) => context.read<AuthorsCubit>().setSortingOption(sortOption),
            itemBuilder: (context) => AuthorSortOption.values.map((sortOption) => PopupMenuItem<AuthorSortOption>(
                value: sortOption,
                child: SortOptionItem(sortOption: sortOption),
              )).toList(),
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AuthorsSearchBar(
              searchController: _searchController,
              onChanged: (query) => context.read<AuthorsCubit>().getAuthors(query),
              onClear: () => context.read<AuthorsCubit>().resetAuthors(),
            ),
          ),
          Expanded(
            child: BlocBuilder<AuthorsCubit, AuthorsState>(
              builder: (context, state) {
                switch (state.viewState) {
                  case ViewState.initial:
                    return Center(child: Text(context.l10n.searchForAuthors));
                  case ViewState.loading:
                    return const Center(child: CircularProgressIndicator());
                  case ViewState.loaded:
                    if (state.authors.isEmpty) {
                      return Center(child: Text(context.l10n.noAuthorsFound));
                    }
                    return AuthorsList(
                      itemCount: state.sortedAuthors.length,
                      authors: state.sortedAuthors,
                    );
                  case ViewState.error:
                    return Center(
                      child: Text(context.l10n.errorWhileFetchingAuthors),
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

