import 'package:check_astra/models/genericScooterCanbus.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class CommandsState extends Equatable {
  const CommandsState();
}

class InitialCommandsState extends CommandsState {
  @override
  List<Object> get props => [];
}

class PostinCommandsState extends CommandsState{
  @override
  List<Object> get props => null;

}

class PostedCommandsState extends CommandsState{
 final String response;
  PostedCommandsState(this.response);
  @override
  List<Object> get props => [response];

}
class ScanedCommandsState extends CommandsState{
  final String barcode;
  ScanedCommandsState(this.barcode);
  @override
  List<Object> get props => [barcode];
}
class ScootedCommandState extends CommandsState{
  final LatLng position;
  ScootedCommandState(this.position);
  @override
  List<Object> get props => [position];

}

class GenericInfoCommandsState extends CommandsState{
  final GenericScooterCanbus data;
  GenericInfoCommandsState(this.data);
  @override
  List<Object> get props => [this.data];

}


class ErrorCommandsState extends CommandsState{
  final String message;
  ErrorCommandsState(this.message);
  @override
  List<Object> get props => [message];

}
