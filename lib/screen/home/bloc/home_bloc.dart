import 'package:chill_music/entity/category/category_response.dart';
import 'package:chill_music/screen/home/bloc/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repo) : super(HomeState());
  final HomeRepository _repo;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    switch (event.type) {
      case HomeEventType.fetchCategories:
        yield* _handleFetchContent(event as FetchHomeContent);
        break;
      default:
    }
  }

  Stream<HomeState> _handleFetchContent(FetchHomeContent event) async* {
    List<CategoryResponse> _categories = await _repo.fetchContent();
    yield HomeState(categories: _categories);
  }
}

class HomeState extends Equatable {
  final List<CategoryResponse>? categories;
  HomeState({this.categories});
  @override
  List<Object?> get props => [
        categories,
      ];
}

enum HomeEventType {
  fetchCategories,
}

class HomeEvent {
  final HomeEventType? type;
  HomeEvent(this.type);
}

class FetchHomeContent extends HomeEvent {
  FetchHomeContent() : super(HomeEventType.fetchCategories);
}
