import 'package:chill_music/core/tools/application_context.dart';
import 'package:chill_music/screen/home/bloc/home_bloc.dart';
import 'package:chill_music/screen/home/widgets/drawer_option_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/category_view.dart';
import 'widgets/more_button.dart';
import 'widgets/new_playlist_item_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    context.read<HomeBloc>().add(FetchHomeContent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            key: _homeScreenKey,
            drawer: DrawerOptionView(),
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
              centerTitle: true,
              leading: MoreButton(
                onTap: () {
                  _homeScreenKey.currentState?.openDrawer();
                },
              ),
              actions: [
                Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.only(right: 10),
                  child: Center(
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/icon_search.png"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
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
                  key: ObjectKey(state.homePlaylists![index].title),
                  playlist: state.homePlaylists![index],
                );
              },
            ),
          );
        },
        listener: (context, state) {});
  }
}
