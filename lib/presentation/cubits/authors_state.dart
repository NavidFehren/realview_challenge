part of 'authors_cubit.dart';

class AuthorsState extends Equatable {
  final ViewState viewState;
  final List<Author> authors;

  const AuthorsState({
    required this.viewState,
    required this.authors,
  });

  factory AuthorsState.initial() {
    return AuthorsState(
      viewState: ViewState.initial,
      authors: [],
    );
  }

  AuthorsState copyWith({
    ViewState? viewState,
    List<Author>? authors,
  }) {
    return AuthorsState(
      viewState: viewState ?? this.viewState,
      authors: authors ?? this.authors,
    );
  }

  @override
  List<Object?> get props => [viewState, authors];
}