part of 'search_turf_name_bloc.dart';

sealed class SearchTurfNameState extends Equatable {
  const SearchTurfNameState();

  @override
  List<Object> get props => [];
}

final class SearchTurfNameInitial extends SearchTurfNameState {}

final class SearchTurfNameLoading extends SearchTurfNameState {}

final class SearchTurfNameSuccess extends SearchTurfNameState {
  List<SearchTurfModel> searchTurfModel = [];
  SearchTurfNameSuccess({required this.searchTurfModel});
}

final class SearchTurfNameFailure extends SearchTurfNameState {}
