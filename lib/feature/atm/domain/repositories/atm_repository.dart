import 'package:atm_simulator/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AtmRepository {
  Future<Either<Failure, String>> login(String name);
  Future<Either<Failure, String>> deposit(int amount);
  Future<Either<Failure, String>> withdraw();
  Future<Either<Failure, String>> transfer(String target, int amount);
  Future<Either<Failure, String>> logout();

  Future<Either<Failure, void>> addATM(String name, int amount);

}