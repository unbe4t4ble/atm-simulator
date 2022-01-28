import 'package:equatable/equatable.dart';

class Atm extends Equatable {
  final String name;
  final int amount;

  Atm({required this.name, required this.amount});

  @override
  List<Object> get props => [name, amount];
}