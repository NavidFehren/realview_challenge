import 'package:mockito/annotations.dart';
import 'package:realview_challenge/domain/repositories/authors_repository.dart';
import 'package:realview_challenge/domain/remote/authors_remote_data_source.dart';

@GenerateMocks([AuthorsRepository, AuthorsRemoteDataSource])
void main() {}
