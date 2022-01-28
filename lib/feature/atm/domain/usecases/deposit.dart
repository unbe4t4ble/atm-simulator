import 'package:atm_simulator/core/errors/failures.dart';
import 'package:atm_simulator/core/usecases/usecase.dart';
import 'package:atm_simulator/feature/atm/domain/repositories/atm_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Deposit implements UseCase<void, ParamDeposit> {
  late AtmRepository atmRepository;

  Deposit(this.atmRepository);

  @override
  Future<Either<Failure, String>> call(ParamDeposit params) {
    return atmRepository.deposit(params.amount);
  }
}

class ParamDeposit extends Equatable {
  final int amount;

  ParamDeposit({required this.amount});

  @override
  List<Object> get props => [amount];
}