import 'package:chill_music/entity/playlist/playlist_entity.dart';
import 'package:chill_music/screen/library/bloc/library_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final LibraryRepository _libraryRepository;
  LibraryBloc(this._libraryRepository)
      : super(
          LibraryState(),
        );

  @override
  Stream<LibraryState> mapEventToState(LibraryEvent event) async* {
    switch (event.type) {
      case LibraryEventType.fetchLibrary:
        yield _handleFetchLibrary(event as FetchLibraryEvent);
        break;
      default:
    }
  }

  LibraryState _handleFetchLibrary(FetchLibraryEvent event) {
    List<PlaylistEntity> _playlists = _libraryRepository.getListPlaylist();
    return state.copyWith(playlists: _playlists);
  }
}

class LibraryState extends Equatable {
  final List<PlaylistEntity>? playlists;

  LibraryState({
    this.playlists,
  });
  @override
  List<Object?> get props => [playlists];
  LibraryState copyWith({required List<PlaylistEntity> playlists}) {
    return LibraryState(playlists: playlists);
  }
}

enum LibraryEventType {
  fetchLibrary,
}

class LibraryEvent {
  final LibraryEventType type;

  LibraryEvent(this.type);
}

class FetchLibraryEvent extends LibraryEvent {
  FetchLibraryEvent() : super(LibraryEventType.fetchLibrary);
}
