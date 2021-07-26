import 'dart:async';

import 'package:chill_music/core/notification/notification.dart';
import 'package:chill_music/entity/playlist/playlist_detail_reponse.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../download_worker.dart';

@injectable
class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final DownloadWorker _downloadWorker;
  final LocalNotidicationManager _localNotidicationManager;
  DownloadBloc(this._downloadWorker, this._localNotidicationManager)
      : super(
          DownloadState(
            tasks: Map<String, TaskDownload>(),
          ),
        );

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    switch (event.type) {
      case DownloadEventType.addToQueue:
        yield _handleAddToQueueDownload(event as AddToQueueDownloadEvent);
        break;
      case DownloadEventType.notifyComplete:
        yield _handleNotifyDownloadComplete(event as DownloadCompleteEvent);
        break;
      default:
    }
  }

  DownloadState _handleNotifyDownloadComplete(DownloadCompleteEvent event) {
    var _task = state.tasks[event.id];
    if (_task == null) {
      return state;
    } else {
      //_task.progress?.close();
      _task = _task.copyWith(
        status: DownloadStatus.completed,
        progress: _task.progress,
        id: event.id,
      );
      var _tasks = Map<String, TaskDownload>();
      state.tasks.forEach((key, value) {
        _tasks[key] = value;
      });

      _tasks[event.id] = _task;
      return state.copyWith(tasks: _tasks);
    }
  }

  DownloadState _handleAddToQueueDownload(AddToQueueDownloadEvent event) {
    var _tasks = state.tasks;
    if (_tasks[event.playlist.title] == null) {
      StreamController<int> _streamController = StreamController<int>();
      _handleDownload(event, _streamController);
      TaskDownload _task = TaskDownload(
          id: event.playlist.title ?? "",
          status: DownloadStatus.downloading,
          progress: _streamController);

      _tasks = Map<String, TaskDownload>();
      state.tasks.forEach((key, value) {
        _tasks[key] = value;
      });
      _tasks[event.playlist.title ?? ""] = _task;
      return state.copyWith(tasks: _tasks);
    } else {
      return state;
    }
  }

  void _handleDownload(AddToQueueDownloadEvent event,
      StreamController<int> streamController) async {
    _downloadWorker.requestDownload(
      title: event.playlist.title ?? "",
      url: event.detail.source?.url128kpbs ?? "",
      onProgress: (progress) {
        print(progress);
        streamController.sink.add(progress);
      },
      onDone: () {
        _localNotidicationManager.showNotification(
          title: event.playlist.title ?? "title",
          body: "Complete download",
          playSound: true,
        );
        add(
          DownloadCompleteEvent(id: event.playlist.title ?? ""),
        );
      },
    );
  }
}

enum DownloadStatus {
  downloading,
  pausing,
  canceled,
  completed,
  none,
}

class TaskDownload extends Equatable {
  final DownloadStatus status;
  final StreamController<int>? progress;
  final String id;
  TaskDownload({
    required this.id,
    required this.status,
    this.progress,
  });
  TaskDownload copyWith({
    required DownloadStatus status,
    StreamController<int>? progress,
    required String id,
  }) {
    return TaskDownload(
      id: id,
      progress: progress,
      status: status,
    );
  }

  @override
  List<Object?> get props => [status, progress, id];
}

class DownloadState extends Equatable {
  final Map<String, TaskDownload> tasks;

  DownloadState({
    required this.tasks,
  });
  DownloadState copyWith({
    required Map<String, TaskDownload> tasks,
  }) {
    return new DownloadState(
      tasks: tasks,
    );
  }

  @override
  List<Object?> get props => [tasks];
}

enum DownloadEventType {
  addToQueue,
  pauseProcess,
  cancelProess,
  notifyComplete,
}

class DownloadEvent {
  final DownloadEventType type;

  DownloadEvent(this.type);
}

class AddToQueueDownloadEvent extends DownloadEvent {
  final PlaylistResponse playlist;
  final PlaylistDetailResponse detail;
  AddToQueueDownloadEvent({
    required this.playlist,
    required this.detail,
  }) : super(DownloadEventType.addToQueue);
}

class DownloadCompleteEvent extends DownloadEvent {
  final String id;
  DownloadCompleteEvent({required this.id})
      : super(DownloadEventType.notifyComplete);
}
