import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/dependency/init_config.dart';
import 'package:chill_music/screen/library/bloc/library_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/library_item_view.dart';

class LibraryScreen extends StatelessWidget {
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
    Application.setSubContext(
      context: context,
      screen: ScreenEnum.library,
    );
    context.read<LibraryBloc>().add(FetchLibraryEvent());
    super.initState();
  }

  @override
  void dispose() {
    Application.setSubContext(
      context: null,
      screen: ScreenEnum.library,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Application.colors.backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              centerTitle: false,
              expandedHeight: 70,
              backgroundColor: Application.colors.backgroundColor,
              flexibleSpace: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      "Library",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ];
        },
        body: BlocConsumer<LibraryBloc, LibraryState>(
          builder: (context, state) {
            if (state.playlists == null) {
              return SizedBox();
            }
            if (state.playlists?.length == 0) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "You haven't downloaded any mix-lofi yet",
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.only(top: 18),
              itemCount: state.playlists!.length,
              itemBuilder: (context, index) {
                var _playlist = state.playlists![index];
                return LibraryItemView(playlist: _playlist);
              },
            );
          },
          listener: (conext, state) {},
        ),
      ),
    );
  }
}
