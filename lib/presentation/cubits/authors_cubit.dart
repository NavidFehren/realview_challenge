import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:realview_challenge/core/enum/view_state.dart';
import 'package:realview_challenge/domain/entities/author.dart';
import 'package:realview_challenge/domain/usecases/get_authors.dart';
import 'package:equatable/equatable.dart';

part 'authors_state.dart';

@injectable
class AuthorsCubit extends Cubit<AuthorsState> {
  final GetAuthors getAuthorsUseCase;

  AuthorsCubit({required this.getAuthorsUseCase})
    : super(AuthorsState.initial());

  Future<void> getAuthors(String query) async {
    emit(state.copyWith(viewState: ViewState.loading));

    final result = await getAuthorsUseCase(query);
    result.fold(
      (failure) => emit(state.copyWith(viewState: ViewState.error)),
      (authors) =>
          emit(state.copyWith(viewState: ViewState.loaded, authors: authors)),
    );
  }

  void resetAuthors() {
    emit(AuthorsState.initial());
  }
}
