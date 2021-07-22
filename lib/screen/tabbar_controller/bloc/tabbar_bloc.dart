import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc()
      : super(TabbarState(
          currentIndex: 0,
        ));

  @override
  Stream<TabbarState> mapEventToState(TabbarEvent event) async* {
    switch (event.type) {
      case TabbarEventType.swipeToChangePage:
        yield _handleSwipeToChangePage(event as SwipeToChangePageEvent);
        break;
      case TabbarEventType.tabToChangePage:
        yield _handleTabToChangePage(event as TapToChangePageEvent);
        break;
      default:
    }
  }

  TabbarState _handleTabToChangePage(TapToChangePageEvent event) {
    var a = state.copyWith(
      index: event.newIndex,
      typeChangePage: TabbarEventType.tabToChangePage,
    );
    return a;
  }

  TabbarState _handleSwipeToChangePage(SwipeToChangePageEvent event) {
    return state.copyWith(
      index: event.newIndex,
      typeChangePage: TabbarEventType.swipeToChangePage,
    );
  }
}

class TabbarState extends Equatable {
  final int? currentIndex;
  final TabbarEventType? typeChangePage;

  TabbarState({
    required this.currentIndex,
    this.typeChangePage,
  });
  TabbarState copyWith(
      {required int index, required TabbarEventType typeChangePage}) {
    return TabbarState(
      currentIndex: index,
      typeChangePage: typeChangePage,
    );
  }

  @override
  List<Object?> get props => [currentIndex, typeChangePage];
}

enum TabbarEventType {
  swipeToChangePage,
  tabToChangePage,
}

class TabbarEvent {
  final TabbarEventType type;

  TabbarEvent(this.type);
}

class TapToChangePageEvent extends TabbarEvent {
  final int newIndex;
  TapToChangePageEvent(this.newIndex) : super(TabbarEventType.tabToChangePage);
}

class SwipeToChangePageEvent extends TabbarEvent {
  final int newIndex;
  SwipeToChangePageEvent(this.newIndex)
      : super(TabbarEventType.swipeToChangePage);
}
