part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchModels data;
  SearchLoaded(this.data);
}

class SearchError extends SearchState {
  final String message;
  SearchError({required this.message});
}
