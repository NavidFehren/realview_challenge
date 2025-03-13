import 'package:flutter/material.dart';
import 'package:realview_challenge/domain/entities/author.dart';

class AuthorsListTile extends StatelessWidget {
  final Author author;

  const AuthorsListTile({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          title: Text(
            author.name,
          ),
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          subtitle: author.birthDate != null ? Text(author.birthDate ?? "") : null,
          onTap: () {
            // Here could open a detailed view of the author with more detailed informations
          },
        ),
      ),
    );
  }
}
