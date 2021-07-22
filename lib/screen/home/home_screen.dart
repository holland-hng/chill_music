import 'package:chill_music/screen/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/category_view.dart';

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
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: ListView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 30),
              itemCount: state.categories?.length ?? 0,
              itemBuilder: (context, index) {
                return CategoryView(
                  category: state.categories![index],
                );
              },
            ),
          );
        },
        listener: (context, state) {});
  }
}
