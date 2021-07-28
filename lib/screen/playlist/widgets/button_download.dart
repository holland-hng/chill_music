import 'package:chill_music/core/download_worker/bloc/download_bloc.dart';
import 'package:chill_music/core/player/bloc/player_bloc.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/entity/playlist/playlist_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    Key? key,
    required this.playlist,
    required DownloadBloc downloadBloc,
    required PlayerBloc playerBloc,
  })  : _downloadBloc = downloadBloc,
        _playerBloc = playerBloc,
        super(key: key);

  final PlaylistResponse playlist;
  final DownloadBloc _downloadBloc;
  final PlayerBloc _playerBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadBloc, DownloadState>(
      builder: (context, state) {
        var _task = state.tasks[playlist.id];

        return BouncingButton(
          key: UniqueKey(),
          onTap: () {
            if (_task == null) {
              _downloadBloc.add(
                AddToQueueDownloadEvent(
                  playlist: _playerBloc.state.playlist!,
                  detail: _playerBloc.state.playlistDetail!,
                ),
              );
            } else {
              //do nothing
            }
          },
          child: Container(
            width: 70,
            height: 60,
            color: Colors.transparent,
            padding: EdgeInsets.only(right: 22),
            child: Center(
              child: _task == null
                  ? Icon(
                      Icons.downloading,
                      size: 29,
                    )
                  : _task.status == DownloadStatus.completed
                      ? Icon(
                          Icons.check_circle,
                          size: 27,
                        )
                      : Container(
                          width: 22,
                          height: 22,
                          child: StreamBuilder<int>(
                            key: ObjectKey(_task.id),
                            stream: _task.progress?.stream,
                            builder: (context, snapshot) {
                              return CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                                value: (snapshot.data ?? 0) / 100,
                                backgroundColor: Colors.grey,
                              );
                            },
                          ),
                        ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
