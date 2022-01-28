import 'package:atm_simulator/core/errors/failures.dart';
import 'package:atm_simulator/core/usecases/usecase.dart';
import 'package:atm_simulator/feature/atm/domain/repositories/atm_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Withdraw implements UseCase<void, ParamsWithdraw> {
  final AtmRepository atmRepository;

  Withdraw(this.atmRepository);

  @override
  Future<Either<Failure, String>> call(ParamsWithdraw params) {
    return atmRepository.withdraw();
  }
}

class ParamsWithdraw extends Equatable {

  @override
  List<Object> get props => [];
}
