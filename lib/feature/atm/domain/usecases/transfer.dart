import 'package:atm_simulator/core/errors/failures.dart';
import 'package:atm_simulator/core/usecases/usecase.dart';
import 'package:atm_simulator/feature/atm/domain/repositories/atm_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Transfer implements UseCase<void, ParamsTransfer> {
  late AtmRepository atmRepository;

  Transfer(this.atmRepository);

  @override
  Future<Either<Failure, String>> call(ParamsTransfer params) {
    return atmRepository.transfer(params.target, params.amount);
  }
}

class ParamsTransfer extends Equatable {
  final String target;
  final int amount;

  ParamsTransfer({required this.target, required this.amount});

  @override
  List<Object> get props => [target, amount];
}