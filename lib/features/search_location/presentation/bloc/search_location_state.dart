part of 'search_location_bloc.dart';

abstract class SearchLocationState extends Equatable {
  const SearchLocationState();

  @override
  List<Object> get props => [];
}

class SearchLocationInitial extends SearchLocationState {}

class LodaingState extends SearchLocationState {}

class LoadedSuccessState extends SearchLocationState {
  final LocationEntity predictions;

  const LoadedSuccessState(this.predictions);
}

class LoadedFailState extends SearchLocationState {
  final String exception;

  const LoadedFailState(this.exception);
}
