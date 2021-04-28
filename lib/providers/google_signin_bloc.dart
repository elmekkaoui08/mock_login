import 'package:bloc/bloc.dart';
import 'package:mock_login/models/users.dart';
import 'package:mock_login/repositories/google_auth_repo.dart';

abstract class GoogleAuthEvents {}

class SignInEvent extends GoogleAuthEvents {}

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
    if (event is SignInEvent) {
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
