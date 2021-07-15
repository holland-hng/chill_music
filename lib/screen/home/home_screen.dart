import 'package:chill_music/dependency/init_config.dart';
import 'package:chill_music/screen/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/category_view.dart';
import 'widgets/trending_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => getIt(),
        ),
      ],
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(FetchHomeContent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          print(state.categories?.length);
          return Scaffold(
            extendBodyBehindAppBar: true,
            //backgroundColor: Application.colors.backgroundColor,
            backgroundColor: Colors.transparent,
            body: ListView.builder(
              itemCount: state.categories?.length ?? 0,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return CategoryView(
                      category: state.categories![index],
                    );
                  case 1:
                    return TrendingView();

                  default:
                    return SizedBox(
                      height: 500,
                    );
                }
              },
            ),
          );
        },
        listener: (context, state) {});
  }
}
