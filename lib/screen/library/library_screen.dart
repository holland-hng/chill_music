import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/dependency/init_config.dart';
import 'package:chill_music/screen/library/bloc/library_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.read<LibraryBloc>().add(FetchLibraryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Application.colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Application.colors.backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Library",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<LibraryBloc, LibraryState>(
        builder: (context, state) {
          if (state.playlists == null) {
            return SizedBox();
          }
          return ListView.builder(
            itemCount: state.playlists!.length,
            itemBuilder: (context, index) {
              return Text(
                state.playlists![index].title,
              );
            },
          );
        },
        listener: (conext, state) {},
      ),
    );
  }
}
