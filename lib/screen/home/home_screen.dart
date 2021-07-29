import 'package:chill_music/core/download_worker/bloc/download_bloc.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/new_playlist_item_view.dart';
import 'widgets/shimmer_content_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _heightAppBar;
  @override
  void initState() {
    _heightAppBar = Application.size.statusBar;
    context.read<HomeBloc>().add(FetchHomeContent());
    context.read<DownloadBloc>().add(FetchStatusDownloadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    backgroundColor: Application.colors.backgroundColor,
                    expandedHeight: 70,
                    flexibleSpace: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Application.colors.backgroundColor,
                            height: Application.size.statusBar + 15,
                          ),
                          Container(
                            color: Application.colors.backgroundColor,
                            child: Container(
                              height: 45,
                              width: Application.size.width - 24 * 2,
                              decoration: BoxDecoration(
                                color: Application.colors.darkGrey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.search,
                                    size: 20,
                                    color: Application.colors.lightGrey,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Your current mood",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Application.colors.lightGrey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Application.colors.backgroundColor,
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ];
              },
              body: state.homePlaylists == null
                  ? ShimmerContentView()
                  : GridView.builder(
                      padding: EdgeInsets.only(
                        top: 14,
                        left: 24,
                        right: 24,
                        bottom: 24,
                      ),
                      itemCount: state.homePlaylists?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 15,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (contetx, index) {
                        return NewPlaylistItemView(
                          key: ObjectKey(state.homePlaylists![index].title),
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
