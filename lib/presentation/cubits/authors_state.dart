part of 'authors_cubit.dart';

class AuthorsState extends Equatable {
  final ViewState viewState;
  final List<Author> authors;
  final AuthorSortOption sortOption;

  const AuthorsState({
    required this.viewState,
    required this.authors,
    required this.sortOption,
  });

  /// Sorts the authors list based on the current sort option.
  List<Author> get sortedAuthors {
    final sortedList = List<Author>.from(authors);
    switch (sortOption) {
      case AuthorSortOption.nameAsc:
        sortedList.sort((a, b) => a.name.compareTo(b.name));
        break;
      case AuthorSortOption.nameDesc:
        sortedList.sort((a, b) => b.name.compareTo(a.name));
        break;
      case AuthorSortOption.topWorkAsc:
        sortedList.sort((a, b) {
          // If both topWork are null, they are equal
          if (a.topWork == null && b.topWork == null) return 0;
          // null comes after non-null values
          if (a.topWork == null) return 1;
          if (b.topWork == null) return -1;
          // Normal sorting for non-null values
          return a.topWork!.compareTo(b.topWork!);
        });
        break;
      case AuthorSortOption.topWorkDesc:
        sortedList.sort((a, b) {
          // If both topWork are null, they are equal
          if (a.topWork == null && b.topWork == null) return 0;
          // null comes after non-null values (reversed for descending order)
          if (a.topWork == null) return -1;
          if (b.topWork == null) return 1;
          // Normal sorting for non-null values (reversed for descending order)
          return b.topWork!.compareTo(a.topWork!);
        });
        break;
      case AuthorSortOption.ratingsAverageAsc:
        sortedList.sort((a, b) {
          return a.ratingsAverage.compareTo(b.ratingsAverage);
        });
        break;
      case AuthorSortOption.ratingsAverageDesc:
        sortedList.sort((a, b) {
          return b.ratingsAverage.compareTo(a.ratingsAverage);
        });
        break;
    }
    return sortedList;
  }

  factory AuthorsState.initial() {
    return AuthorsState(
      viewState: ViewState.initial,
      authors: [],
      sortOption: AuthorSortOption.nameAsc,
    );
  }

  AuthorsState copyWith({
    ViewState? viewState,
    List<Author>? authors,
    AuthorSortOption? sortOption,
  }) {
    return AuthorsState(
      viewState: viewState ?? this.viewState,
      authors: authors ?? this.authors,
      sortOption: sortOption ?? this.sortOption,
    );
  }

  @override
  List<Object?> get props => [viewState, authors, sortOption];
}