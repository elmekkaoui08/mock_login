import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mock_login/models/users.dart';
import 'package:mock_login/repositories/google_auth_repo.dart';

abstract class GoogleAuthEvents {}

class SignInWithGoogleEvent extends GoogleAuthEvents {}

class SignInWithEmailPasswordEvent extends GoogleAuthEvents {
  String email, password;
  SignInWithEmailPasswordEvent({@required this.email, @required this.password});
}

class SignUpWithEmailPasswordEvent extends GoogleAuthEvents {
  String email, password;
  SignUpWithEmailPasswordEvent({@required this.email, @required this.password});
}

class SignOutEvent extends GoogleAuthEvents {}

enum RequestState { SIGNING, SIGNED, ERROR, NONE, SIGNEDOUT }

class SigningState {
  Users user;
  RequestState requestState;
  String errorMessage;

  SigningState({this.user, this.requestState, this.errorMessage});
}

class AuthentificationBloc extends Bloc<GoogleAuthEvents, SigningState> {
  GoogleAuthRepo googleAuthRepo;
  AuthentificationBloc(SigningState initialState, this.googleAuthRepo)
      : super(initialState);

  @override
  Stream<SigningState> mapEventToState(GoogleAuthEvents event) async* {
    if (event is SignInWithGoogleEvent) {
      yield SigningState(
          user: Users(), requestState: RequestState.SIGNING, errorMessage: '');
      try {
        await googleAuthRepo.login();
        final connectedUser = googleAuthRepo.getConnectedUser();
        Users user = Users(
            name: connectedUser.displayName,
            hasStory: false,
            imageUrl: connectedUser.photoURL,
            isOnline: true);
        yield SigningState(
            user: user, errorMessage: '', requestState: RequestState.SIGNED);
      } catch (e) {
        yield SigningState(
            user: Users(),
            errorMessage: e.toString(),
            requestState: RequestState.ERROR);
        throw Exception('Error during getting data $e');
      }
    } else if (event is SignInWithEmailPasswordEvent) {
      yield SigningState(
        user: Users(),
        requestState: RequestState.SIGNING,
        errorMessage: '',
      );
      try {
        final _auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        yield SigningState(
          user: Users(
            name: _auth.user.displayName,
            hasStory: true,
            isOnline: true,
            imageUrl: 'logo',
          ),
          requestState: RequestState.SIGNED,
          errorMessage: '',
        );
      } catch (e) {
        yield SigningState(
            user: Users(),
            errorMessage: e.toString(),
            requestState: RequestState.ERROR);
        throw Exception('Error during getting data $e');
      }
    } else if (event is SignUpWithEmailPasswordEvent) {
      yield SigningState(
          errorMessage: '', requestState: RequestState.SIGNING, user: Users());
      try {
        final _auth = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: event.email, password: event.password);

        yield SigningState(
            user: Users(
              name: _auth.user.email.substring(
                _auth.user.email.indexOf('@'),
              ),
            ),
            requestState: RequestState.SIGNED,
            errorMessage: '');
      } catch (e) {
        yield SigningState(
            errorMessage: e.toString(),
            requestState: RequestState.ERROR,
            user: Users());
      }
    } else if (event is SignOutEvent) {
      yield SigningState(
          user: Users(), requestState: RequestState.SIGNING, errorMessage: '');
      try {
        await googleAuthRepo.logout();

        yield SigningState(
            user: Users(),
            requestState: RequestState.SIGNEDOUT,
            errorMessage: '');
      } catch (e) {
        yield SigningState(
            user: Users(),
            errorMessage: e.toString(),
            requestState: RequestState.ERROR);
        throw Exception('Error during getting data $e');
      }
    }
  }
}
