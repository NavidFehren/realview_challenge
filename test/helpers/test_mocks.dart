import 'package:mockito/annotations.dart';
import 'package:realview_challenge/domain/repositories/authors_repository.dart';
import 'package:realview_challenge/domain/remote/authors_remote_data_source.dart';
import 'package:dio/dio.dart';

@GenerateMocks([
  AuthorsRepository, 
  AuthorsRemoteDataSource,
  Dio,
  Response,
])
void main() {}
