import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:check_astra/provider/login_logic.dart';
import 'package:flutter/material.dart';
import 'login_bloc_event.dart';
import 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc({@required this.logic});
  final LoginLogic logic;

  @override
  LoginBlocState get initialState => InitialLoginBlocState();

  @override
  Stream<LoginBlocState> mapEventToState(
    LoginBlocEvent event,
  ) async* {
    if(event is DoLoginEvent){
      yield LogginInBlocState();
        try{
        var responseData =  await logic.login(event.email, event.password);
          yield LoggedInBlocState(responseData);
        }on LoginException{
          yield ErrorBlocState("No se pudo logueaaar");
        }
    }
  }
}
