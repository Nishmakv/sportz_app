part of 'search_turf_name_bloc.dart';

sealed class SearchTurfNameEvent extends Equatable {
  const SearchTurfNameEvent();

  @override
  List<Object> get props => [];
}
class SearchTurfNameProcess extends SearchTurfNameEvent {
  final String name;
 
  const SearchTurfNameProcess({
    required this.name,
   
  });
}
