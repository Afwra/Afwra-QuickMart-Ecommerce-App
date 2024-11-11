sealed class SearchState {}

final class SearchHistoryLoading extends SearchState {}

final class SearchHistorySuccess extends SearchState {
  List<String> searchHistory;
  SearchHistorySuccess({required this.searchHistory});
}

final class SearchHistoryFail extends SearchState {
  String errMsg;
  SearchHistoryFail({required this.errMsg});
}
