import 'package:atm_simulator/core/errors/failures.dart';
import 'package:atm_simulator/core/usecases/usecase.dart';
import 'package:atm_simulator/feature/atm/domain/repositories/atm_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Login implements UseCase<void, ParamLogin> {
  late AtmRepository atmRepository;

  Login(this.atmRepository);

  @override
  Future<Either<Failure, String>> call(ParamLogin params) {
    return atmRepository.login(params.name);
  }
}

class ParamLogin extends Equatable {
  final String name;

  ParamLogin({required this.name});

  @override
  List<Object> get props => [name];
}