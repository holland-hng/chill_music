import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/core/widgets/bouncing_button.dart';
import 'package:chill_music/dependency/init_config.dart';
import 'package:chill_music/screen/library/bloc/library_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryScreen extends StatelessWidget {
  static BuildContext? context;
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LibraryBloc>(
          create: (BuildContext context) => getIt(),
        ),
      ],
      child: _LibraryScreen(),
    );
  }
}

class _LibraryScreen extends StatefulWidget {
  const _LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<_LibraryScreen> {
  @override
  void initState() {
    context.read<LibraryBloc>().add(FetchLibraryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LibraryScreen.context = context;
    return Scaffold(
      backgroundColor: Application.colors.backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              heroTag: "LibraryScreen",
              backgroundColor: Application.colors.backgroundColor,
              largeTitle: Text(
                "Library",
                style: TextStyle(color: Colors.white),
              ),
            )
          ];
        },
        body: BlocConsumer<LibraryBloc, LibraryState>(
          builder: (context, state) {
            if (state.playlists == null) {
              return SizedBox();
            }
            return ListView.builder(
              itemCount: state.playlists!.length,
              itemBuilder: (context, index) {
                var _playlist = state.playlists![index];
                return BouncingButton(
                  key: ObjectKey("LibaryItem-${_playlist.id}"),
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: 22, bottom: 22),
                    height: 60,
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: _playlist.thumbnail,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Container(
                          width: Application.size.width - 15 - 60 - 60,
                          height: 60,
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _playlist.title,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                _playlist.publisher.name ?? "publisher",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w200),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        // BouncingButton(
                        //   onTap: () {},
                        //   child: Container(
                        //     padding: const EdgeInsets.only(left: 15),
                        //     width: 60,
                        //     height: 60,
                        //     color: Colors.transparent,
                        //     child: Icon(
                        //       Icons.more_vert,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          listener: (conext, state) {},
        ),
      ),
    );
  }
}
