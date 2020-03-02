import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:check_astra/provider/register_logic.dart';
import 'package:flutter/cupertino.dart';
import '../bloc.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterLogic logic;
 RegisterBloc ({@required this.logic});
  @override
  RegisterState get initialState => InitialRegisterState();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if(event is doRegisterEvent){
      yield RegisterinInBlocState();
      try{
        var doneRegister =  await logic.register(event.email, event.password, event.password2);
        yield RegisteredInBlocState(doneRegister);
      }on RegisterException{
        yield ErrorRegisterBlocState("Fallo en el registro");


      }
    }
  }
}
