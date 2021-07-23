import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/category_view.dart';
import 'widgets/new_playlist_item_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(FetchHomeContent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Application.colors.backgroundColor,
                elevation: 0,
                title: Text(
                  "Chill Music",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: GridView.builder(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 15),
                itemCount: state.homePlaylists?.length ?? 0,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemBuilder: (contetx, index) {
                  return NewPlaylistItemView(
                    playlist: state.homePlaylists![index],
                  );
                },
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
