import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:realview_challenge/core/error/exceptions.dart';
import 'package:realview_challenge/data/models/author_model.dart';
import 'package:realview_challenge/domain/remote/authors_remote_data_source.dart';

@Injectable(as: AuthorsRemoteDataSource)
class AuthorsRemoteDataSourceImpl implements AuthorsRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = 'https://openlibrary.org';
  CancelToken? _cancelToken;

  AuthorsRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<AuthorModel>> searchAuthors(String query) async {
    // Cancel previous request if it exists
    if (_cancelToken != null) {
      _cancelToken!.cancel('New search request initiated');
    }
    
    // Create a new cancel token for this request
    _cancelToken = CancelToken();
    
    try {
      final response = await _dio.get(
        '$_baseUrl/search/authors.json',
        queryParameters: {'q': query},
        cancelToken: _cancelToken,
      );

      if (response.statusCode == 200) {
        final List<dynamic> docs = response.data['docs'];
        final List<AuthorModel> allAuthors = docs.map((doc) => AuthorModel.fromJson(doc)).toList();
        
        // Filter authors based on the query
        if (query.isNotEmpty) {
          return allAuthors.where((author) =>
            author.name.toLowerCase().contains(query.toLowerCase())).toList();
        }
        
        return allAuthors;
      } else {
        throw Exception('Failed to search authors: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw RequestCancelledException();
      }
      // For other types of DioException, rethrow the exception
      throw Exception('Failed to search authors: ${e.message}');
    } catch (e) {
      throw Exception(e.toString());
    } 
  }
}
