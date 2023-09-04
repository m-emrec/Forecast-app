import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/search_location/data/models/location_model.dart';
import 'package:weather/features/search_location/domain/entities/location_entity.dart';
import 'package:weather/features/search_location/domain/usecases/get_predictions_use_case.dart';

import '../../../../core/constants/logger.dart';

part 'search_location_event.dart';
part 'search_location_state.dart';

class SearchLocationBloc
    extends Bloc<SearchLocationEvent, SearchLocationState> {
  final GetPredictionsUseCase _getPredictionsUseCase;
  SearchLocationBloc(this._getPredictionsUseCase)
      : super(SearchLocationInitial()) {
    on<SearchLocationEvent>((event, emit) {});
    on<SearchLocationInitialEvent>((event, emit) {});
    on<SearchEvent>(
      (event, emit) async {
        emit(LodaingState());

        final dataState =
            await _getPredictionsUseCase.getPredictions(event.query);

        if (dataState is DataSuccess) {
          emit(LoadedSuccessState(dataState.data!));
        } else {
          emit(LoadedFailState(dataState.exception ?? "Unecpected Error"));
        }
      },
    );
  }
}
