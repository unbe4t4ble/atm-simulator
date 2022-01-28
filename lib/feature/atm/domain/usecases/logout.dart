import 'package:atm_simulator/core/errors/failures.dart';
import 'package:atm_simulator/core/usecases/usecase.dart';
import 'package:atm_simulator/feature/atm/domain/repositories/atm_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Logout implements UseCase<void, ParamLogout> {
  final AtmRepository atmRepository;

  Logout(this.atmRepository);

  @override
  Future<Either<Failure, String>> call(ParamLogout params) {
    return atmRepository.logout();
  }
}

class ParamLogout extends Equatable {

  @override
  List<Object> get props => [];
}
