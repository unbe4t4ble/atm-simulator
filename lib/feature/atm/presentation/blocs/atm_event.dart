
part of 'atm_bloc.dart';

abstract class AtmEvent extends Equatable {
  const AtmEvent();

  @override
  List<Object> get props => [];
}

class AtmSubmitEvent extends AtmEvent {
  final String command;

  AtmSubmitEvent({required this.command});

  @override
  List<Object> get props => [command];
}