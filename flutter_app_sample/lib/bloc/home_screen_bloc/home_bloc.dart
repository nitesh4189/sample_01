import 'package:flutter_app_sample/bloc/home_screen_bloc/home_event.dart';
import 'package:flutter_app_sample/bloc/home_screen_bloc/home_state.dart';
import 'package:flutter_app_sample/data/repo/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeUninitializedState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    try {
      if (event is ShowTwoDataEvent) {
        yield HomeFetchingState();

        var response = await HomeRepository().fetchListResponse(
            allDataRequired: false,
            threeDataRequired: false,
            twoDataRequired: true);
        if (response != null && response.isNotEmpty) {
          yield HomeFetchedState(list: response);
        } else {
          yield HomeEmptyState();
        }
      } else if (event is ShowThreeDataEvent) {
        yield HomeFetchingState();

        var response = await HomeRepository().fetchListResponse(
            twoDataRequired: false,
            threeDataRequired: true,
            allDataRequired: false);
        if (response != null && response.isNotEmpty) {
          yield HomeFetchedState(list: response);
        } else {
          yield HomeEmptyState();
        }
      } else if (event is ShowAllDataEvent) {
        yield HomeFetchingState();

        var response = await HomeRepository().fetchListResponse(
            allDataRequired: true,
            threeDataRequired: false,
            twoDataRequired: false);
        if (response != null && response.isNotEmpty) {
          yield HomeFetchedState(list: response);
        } else {
          yield HomeEmptyState();
        }
      } else {}
    } catch (_) {
      yield HomeErrorState();
    }
  }

  @override
  // TODO: implement initialState
  HomeState get initialState => HomeUninitializedState();
}
