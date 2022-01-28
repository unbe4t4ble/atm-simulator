import 'package:atm_simulator/feature/atm/data/datasources/atm_local_data_source.dart';
import 'package:atm_simulator/core/errors/failures.dart';
import 'package:atm_simulator/feature/atm/domain/repositories/atm_repository.dart';
import 'package:dartz/dartz.dart';

class AtmRepositoryImpl implements AtmRepository {
  final AtmLocalDataSource atmLocalDataSource;

  AtmRepositoryImpl({required this.atmLocalDataSource});

  @override
  Future<Either<Failure, void>> addATM(String name, int amount) async {
    try {
      return Right(await atmLocalDataSource.addATM(name, amount));
    }on DataBaseFailure {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deposit(int amount) async {
    try {
      return Right(await atmLocalDataSource.deposit(amount));
    }on DataBaseFailure {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, String>> login(String name) async {
    try {
      return Right(await atmLocalDataSource.login(name));
    }on DataBaseFailure {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      return Right(await atmLocalDataSource.logout());
    }on DataBaseFailure {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, String>> transfer(String target, int amount) async {
    try {
      return Right(await atmLocalDataSource.transfer(target, amount));
    }on DataBaseFailure {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, String>> withdraw() async {
    try {
      return Right(await atmLocalDataSource.withdraw());
    }on DataBaseFailure {
      return Left(DataBaseFailure());
    }
  }

}