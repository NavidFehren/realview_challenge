import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:realview_challenge/data/models/author_model.dart';
import 'package:realview_challenge/domain/remote/authors_remote_data_source.dart';

@Injectable(as: AuthorsRemoteDataSource)
class AuthorsRemoteDataSourceImpl implements AuthorsRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = 'https://openlibrary.org';

  AuthorsRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<AuthorModel>> searchAuthors(String query) async {
    final response = await _dio.get(
      '$_baseUrl/search/authors.json',
      queryParameters: {'q': query},
    );

    if (response.statusCode == 200) {
      final List<dynamic> docs = response.data['docs'];
      final List<AuthorModel> allAuthors = docs.map((doc) => AuthorModel.fromJson(doc)).toList();
      
      // Filter results to only include authors whose names contain the exact query string
      if (query.isNotEmpty) {
        return allAuthors.where((author) => 
          author.name.toLowerCase().contains(query.toLowerCase())).toList();
      }
      
      return allAuthors;
    } else {
      throw Exception('Failed to search authors: ${response.statusCode}');
    }
  }
}
