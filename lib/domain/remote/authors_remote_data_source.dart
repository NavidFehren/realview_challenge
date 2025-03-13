import 'package:realview_challenge/data/models/author_model.dart';

abstract class AuthorsRemoteDataSource {
  /// Searches for authors based on the query
  Future<List<AuthorModel>> searchAuthors(String query);
}