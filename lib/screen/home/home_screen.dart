import 'package:chill_music/core/download_worker/bloc/download_bloc.dart';
import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/new_playlist_item_view.dart';
import 'package:auto_animated/auto_animated.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double _heightAppBar;
  @override
  void initState() {
    _heightAppBar = 45 +
        ((34 - Application.size.statusBar) < 0
            ? 0
            : (34 - Application.size.statusBar));
    context.read<HomeBloc>().add(FetchHomeContent());
    context.read<DownloadBloc>().add(FetchStatusDownloadEvent());
    super.initState();
  }

  final options = LiveOptions(
    delay: Duration(seconds: 0),
    showItemInterval: Duration(milliseconds: 50),
    showItemDuration: Duration(milliseconds: 300),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

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
                    expandedHeight: _heightAppBar,
                    flexibleSpace: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Application.colors.backgroundColor,
                            height: Application.size.statusBar + 14,
                          ),
                          Container(
                            color: Application.colors.backgroundColor,
                            child: Container(
                              height: 45,
                              width: Application.size.width - 34 * 2,
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
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Your current mood",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Container(
                          //   color: Colors.transparent,
                          //   height: 34,
                          // ),
                        ],
                      ),
                    ),
                  )
                ];
              },
              body: LiveGrid.options(
                options: options,
                padding: EdgeInsets.only(
                  top: 34,
                  left: 34,
                  right: 34,
                  bottom: 34,
                ),
                itemCount: state.homePlaylists?.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 34,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                ),
                itemBuilder: (contetx, index, animation) {
                  return FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: NewPlaylistItemView(
                      key: ObjectKey(state.homePlaylists![index].title),
                      playlist: state.homePlaylists![index],
                    ),
                  );
                },
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
