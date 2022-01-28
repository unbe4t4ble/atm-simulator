import 'package:atm_simulator/feature/atm/data/datasources/atm_local_data_source.dart';
import 'package:atm_simulator/feature/atm/data/repositories/atm_repository_impl.dart';
import 'package:atm_simulator/feature/atm/domain/repositories/atm_repository.dart';
import 'package:atm_simulator/feature/atm/domain/usecases/deposit.dart';
import 'package:atm_simulator/feature/atm/domain/usecases/login.dart';
import 'package:atm_simulator/feature/atm/domain/usecases/logout.dart';
import 'package:atm_simulator/feature/atm/domain/usecases/transfer.dart';
import 'package:atm_simulator/feature/atm/domain/usecases/withdraw.dart';
import 'package:atm_simulator/feature/atm/presentation/blocs/atm_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<AtmBloc>(
        () => AtmBloc("", sl(), sl(), sl(), sl(), sl())
  );

  // Use cases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Logout(sl()));
  sl.registerLazySingleton(() => Withdraw(sl()));
  sl.registerLazySingleton(() => Deposit(sl()));
  sl.registerLazySingleton(() => Transfer(sl()));

  // Repository
  sl.registerLazySingleton<AtmRepository>(
        () => AtmRepositoryImpl(atmLocalDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AtmLocalDataSource>(
          () => AtmLocalDataSourceImpl());

}