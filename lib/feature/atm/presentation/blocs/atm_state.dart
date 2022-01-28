part of 'atm_bloc.dart';

abstract class AtmState extends Equatable {
  const AtmState();

  @override
  List<Object> get props => [];
}

class AtmSubmitState extends AtmState {}
class AtmSubmitFailState extends AtmState {}