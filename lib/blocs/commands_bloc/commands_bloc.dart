import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:check_astra/provider/commands_logic.dart';
import 'package:flutter/material.dart';
import '../bloc.dart';

class CommandsBloc extends Bloc<CommandsEvent, CommandsState> {
  CommandsBloc({@required this.logic});
  final CommandsLogic logic;
  @override
  CommandsState get initialState => InitialCommandsState();

  @override
  Stream<CommandsState> mapEventToState(
    CommandsEvent event,
  ) async* {
    if(event is PostCommandsEvent){
      yield PostinCommandsState();
      try{
        var response = await logic.postCommand(event.action, event.imei);
        yield PostedCommandsState(response);
      }on CommandsException{
        yield ErrorCommandsState("Fallo al enviar el comando");
      }
    }
    if( event is  ScanEvent){
      try{
        var response = await logic.scan();
        yield ScanedCommandsState(response);
      }on CommandsException{
        yield ErrorCommandsState("Fallo al enviar el comando");
      }
    }
    if( event is FindScootEvent){
      try{
        var response = await logic.find(event.imei);
        yield ScootedCommandState(response);
      }on CommandsException{
        yield ErrorCommandsState("Fallo al enviar el comando");
      }
    }
    if( event is GenericInfoEvent){
      var response = await logic.genericInfo(event.imei);
      yield GenericInfoCommandsState(response);
    }
  }
}
