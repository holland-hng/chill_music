import 'package:chill_music/entity/auth/auth_entity.dart';
import 'package:chill_music/screen/login/widgets/login_button.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'auth_repository.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  AuthBloc(this._repository) : super(AuthState());
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    switch (event.eventType) {
      case AuthEventType.login:
        yield await _handleLogin(event as LoginEvent);
        break;
      case AuthEventType.fetch:
        break;
      case AuthEventType.logout:
        break;
      default:
    }
  }

  bool get isAuthValid {
    return state.authInfo != null;
  }

  Future<AuthState> _handleLogin(LoginEvent event) async {
    switch (event.loginType) {
      case LoginType.facebook:
        break;
      case LoginType.google:
        return await _handleLoginGoogle();
      case LoginType.twitter:
        break;
      default:
    }
    return state;
  }

  Future<AuthState> _handleLoginGoogle() async {
    try {
      GoogleSignInAccount? _account = await _googleSignIn.signIn();
      print("DEBUG $_account");
    } catch (error) {
      print(error);
    }
    return state;
  }
}

class AuthState extends Equatable {
  final AuthEntity? authInfo;

  AuthState({this.authInfo});

  AuthState copyWith({
    AuthEntity? authInfo,
  }) {
    return AuthState(authInfo: authInfo);
  }

  @override
  List<Object?> get props => [authInfo];
}

enum AuthEventType {
  login,
  fetch,
  logout,
}

class AuthEvent {
  final AuthEventType eventType;

  AuthEvent(this.eventType);
}

class LoginEvent extends AuthEvent {
  final LoginType loginType;
  LoginEvent(this.loginType) : super(AuthEventType.login);
}
