import 'package:flutter_app_sample/data/repo/home_data.dart';

abstract class HomeState {}

class HomeUninitializedState extends HomeState {}

class HomeFetchingState extends HomeState {}

class HomeFetchedState extends HomeState {
  List<HomeDataList> list;

  HomeFetchedState({this.list});
}

class HomeErrorState extends HomeState {}

class HomeEmptyState extends HomeState {}
