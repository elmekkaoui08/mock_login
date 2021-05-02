import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_login/providers/google_signin_bloc.dart';
import 'package:mock_login/shared/components/costum_scaffold.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthentificationBloc, SigningState>(
      builder: (context, state) {
        if (state.requestState == RequestState.SIGNING) {
          return IndecatorScaffold();
        } else if (state.requestState == RequestState.ERROR) {
          return ErrorScaffold(
            errorMessage: state.errorMessage,
          );
        } else if (state.requestState == RequestState.SIGNED) {
          return HomeScreenScaffold();
        } else {
          return Scaffold();
        }
      },
    );
  }
}

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold({
    Key key,
    @required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error : $errorMessage'),
          ],
        ),
      ),
    );
  }
}
