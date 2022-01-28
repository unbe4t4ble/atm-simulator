import 'package:atm_simulator/feature/atm/domain/usecases/deposit.dart';
import 'package:atm_simulator/feature/atm/domain/usecases/login.dart';
import 'package:atm_simulator/feature/atm/domain/usecases/logout.dart';
import 'package:atm_simulator/feature/atm/domain/usecases/transfer.dart';
import 'package:atm_simulator/feature/atm/domain/usecases/withdraw.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'atm_event.dart';
part 'atm_state.dart';

class AtmBloc extends Bloc<AtmEvent, String> {

  AtmBloc(String initialState, this.login, this.deposit, this.logout, this.withdraw, this.transfer) : super(initialState);

  late String result = "123";
  final Login login;
  final Logout logout;
  final Deposit deposit;
  final Withdraw withdraw;
  final Transfer transfer;

  @override
  Stream<String> mapEventToState(AtmEvent event) async* {
    if (event is AtmSubmitEvent) {
      String command =  event.command.trim();
      var splitText = command.split(" ");
      if(splitText[0] == "login"){
        if(splitText[1].isEmpty){
          result = "login [name]\n";
        }else{
          final failedOrSuccess = await login(ParamLogin(name: splitText[1]));
          if (failedOrSuccess.isRight()) {
            result = failedOrSuccess.getOrElse(() => "");
          }
        }
      }
      else
      if(splitText[0] == "logout"){
        final failedOrSuccess = await logout(ParamLogout());
        if (failedOrSuccess.isRight()) {
          result = failedOrSuccess.getOrElse(() => "");
        }
      }
      else
      if(splitText[0] == "deposit"){
        if(splitText[1].isEmpty){
          result = "deposit [amount]\n";
        }else{
          final failedOrSuccess = await deposit(ParamDeposit(amount: int.parse(splitText[1])));
          if (failedOrSuccess.isRight()) {
            result = failedOrSuccess.getOrElse(() => "");
          }
        }
      }
      else
      if(splitText[0] == "withdraw"){
        final failedOrSuccess = await withdraw(ParamsWithdraw());
        if (failedOrSuccess.isRight()) {
          result = failedOrSuccess.getOrElse(() => "");
        }
      }
      else
      if(splitText[0] == "transfer"){
        if(splitText[1].isEmpty || splitText[2].isEmpty){
          result = "deposit [target] [amount]\n";
        }else{
          final failedOrSuccess = await transfer(ParamsTransfer(target: splitText[1], amount: int.parse(splitText[2])));
          if (failedOrSuccess.isRight()) {
            result = failedOrSuccess.getOrElse(() => "");
          }
        }
      }else{
        result = "'${splitText[0]}' is not recognized as an internal or external command\n";
      }

      command = "\n" + r"$ " + command + "\n";
      
      yield command + result;
    }
  }
}