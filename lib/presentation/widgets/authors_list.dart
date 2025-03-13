
import 'package:flutter/material.dart';
import 'package:realview_challenge/domain/entities/author.dart';
import 'package:realview_challenge/presentation/widgets/authors_list_tile.dart';

class AuthorsList extends StatelessWidget {
  final int itemCount;
  final List<Author> authors;

  const AuthorsList({
    super.key,
    required this.itemCount,
    required this.authors,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return AuthorsListTile(author: authors[index]);
      },
    );
  }
}