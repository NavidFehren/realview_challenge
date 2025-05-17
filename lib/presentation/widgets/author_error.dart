import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview_challenge/core/localization/app_localizations_extension.dart';
import 'package:realview_challenge/presentation/cubits/authors_cubit.dart';

class AuthorError extends StatelessWidget {
  final String query;
  const AuthorError({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(context.l10n.errorWhileFetchingAuthors),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => context.read<AuthorsCubit>().getAuthors(query),
          child: Text(context.l10n.retry),
        ),
      ],
    );
  }
}
