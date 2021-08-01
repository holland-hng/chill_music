import 'package:chill_music/core/download_worker/bloc/download_bloc.dart';
import 'package:chill_music/screen/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_appbar_view.dart';
import 'widgets/new_playlist_item_view.dart';
import 'widgets/shimmer_content_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(FetchHomeContent());
    context.read<DownloadBloc>().add(FetchStatusDownloadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[HomeAppBarView()];
          },
          body: Stack(
            children: [
              BlocConsumer<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.homePlaylists == null) return ShimmerContentView();
                  return GridView.builder(
                    padding: EdgeInsets.only(
                      top: 18,
                      left: 28,
                      right: 28,
                      bottom: 28,
                    ),
                    itemCount: state.homePlaylists?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 28,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (contetx, index) {
                      return NewPlaylistItemView(
                        key: ObjectKey(state.homePlaylists![index].title),
                        playlist: state.homePlaylists![index],
                      );
                    },
                  );
                },
                listener: (context, state) {},
              ),
            ],
          )),
    );
  }
}
