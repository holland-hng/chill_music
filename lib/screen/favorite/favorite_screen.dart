import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/favorite_bloc.dart';
import 'widgets/favorite_itemt_view.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(FetchFavoriteFirstimeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //drawer: DrawerOptionView(),
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
                        "Favorite",
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
          body: ListView(
            padding: EdgeInsets.only(top: 18, bottom: 28),
            children: [
              BlocBuilder<FavoriteBloc, FavoriteState>(
                  builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.playlists?.length ?? 0,
                  itemBuilder: (context, index) {
                    var _playlist = state.playlists![index];
                    return FavoriteItemView(playlist: _playlist);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
