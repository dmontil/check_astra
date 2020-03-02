import 'package:equatable/equatable.dart';

abstract class CommandsEvent extends Equatable {
  const CommandsEvent();
}

class PostCommandsEvent extends CommandsEvent{
  final String action;
  final String imei;
  PostCommandsEvent(this.action, this.imei);
  @override
  List<Object> get props => [action,imei];
}

class ScanEvent extends CommandsEvent{
  @override
  List<Object> get props => [];
}

class findScootEvent extends CommandsEvent{
  final String imei;
  findScootEvent(this.imei);
  @override
  List<Object> get props => [imei];

}
