import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:realview_challenge/core/enum/view_state.dart';
import 'package:realview_challenge/core/error/failures.dart';
import 'package:realview_challenge/domain/entities/author.dart';
import 'package:realview_challenge/domain/enum/author_sort_option.dart';
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
      (failure) {
        // Handle cancellation specifically and keep showing loading state
        if (failure is RequestCancelledFailure) {
          emit(state.copyWith(viewState: ViewState.loading));
          return;
        }

        emit(state.copyWith(viewState: ViewState.error));
      },
      (authors) =>
          emit(state.copyWith(viewState: ViewState.loaded, authors: authors)),
    );
  }

  /// Set the sorting option for the authors list.
  /// This will trigger a re-sort of the authors based on the selected option.
  /// The sorting is done in the [AuthorsState] class.
  void setSortingOption(AuthorSortOption option) {
    emit(state.copyWith(sortOption: option));
  }

  void resetAuthors() {
    emit(AuthorsState.initial());
  }
}
