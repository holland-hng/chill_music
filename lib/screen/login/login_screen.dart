import 'package:chill_music/screen/login/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthBloc _authBloc;
  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/icons/launcher_icon_white.png"),
                  ),
                ),
              ),
              Text(
                "Link Chill Music",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 20, bottom: 25),
                child: Text(
                  "Link your account to listen to your\nfavorite lo-fi mixes,",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              LoginButton(
                type: LoginType.google,
                callBack: () {
                  _authBloc.add(LoginEvent(LoginType.google));
                },
              ),
              SizedBox(
                height: 12,
              ),
              LoginButton(
                type: LoginType.facebook,
                callBack: () {
                  _authBloc.add(LoginEvent(LoginType.facebook));
                },
              ),
              SizedBox(
                height: 12,
              ),
              LoginButton(
                type: LoginType.twitter,
                callBack: () {
                  _authBloc.add(LoginEvent(LoginType.twitter));
                },
              ),
            ],
          ),
        ),
        listener: (context, state) {});
  }
}
