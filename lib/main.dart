import 'package:atm_simulator/feature/atm/presentation/blocs/atm_bloc.dart';
import 'package:atm_simulator/feature/atm/presentation/pages/atm_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injector_container.dart' as di;
import 'injector_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AtmBloc>(
          create: (context) => sl<AtmBloc>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATM Simulation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AtmPage(),
    );
  }
}
