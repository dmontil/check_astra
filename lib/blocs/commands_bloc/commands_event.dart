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

class FindScootEvent extends CommandsEvent{
  final String imei;
  FindScootEvent(this.imei);
  @override
  List<Object> get props => [imei];

}

class GenericInfoEvent extends CommandsEvent{
  final String imei;
  GenericInfoEvent(this.imei);
  @override
  List<Object> get props => [imei];

}
