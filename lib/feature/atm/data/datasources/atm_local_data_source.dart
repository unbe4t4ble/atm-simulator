import 'package:atm_simulator/core/util/sharedpref.dart';
import 'package:atm_simulator/feature/atm/data/models/atm_model.dart';

abstract class AtmLocalDataSource{
  Future<String> login(String name);
  Future<String> deposit(int amount);
  Future<String> withdraw();
  Future<String> transfer(String target, int amount);
  Future<String> logout();

  Future<void> addATM(String name, int amount);

  Future<AtmModel?> getAtm(String name);
}

class AtmLocalDataSourceImpl implements AtmLocalDataSource {
  
  @override
  Future<String> login(String name) async {
    final AtmModel? atmModel = await getAtm(name);
    await SharedPref().setUserLogin(name);
    if(atmModel != null){
      return "Hello, $name!\n" + r"Your balance is $" + "${atmModel.amount}";
    }else{
      await addATM(name, 0);
      return "Hello, $name!\n" + r"Your balance is $0";
    }
  }

  @override
  Future<String> deposit(int amount) async {
    final userLogin = await SharedPref().getUserLogin();
    if(userLogin.isNotEmpty){
      final AtmModel? atmModel = await getAtm(userLogin);
        int amountUser = atmModel?.amount ?? 0;
        int newAmount = amount + amountUser;
        await addATM(userLogin, newAmount);
        return r"Your balance is $"+"$amount";
      
    }else{
      return "You are not login";
    }
  }

  @override
  Future<String> transfer(String target, int amount) async {
    final userLogin = await SharedPref().getUserLogin();

    final AtmModel? userDataLogin = await getAtm(userLogin);
    final AtmModel? userTarget = await getAtm(target);

    if(userLogin.isEmpty){
      return "You are not login.\n";
    }

    if(userTarget == null){
      return "Your transfer target is not registered.\n"; 
    }

    int currentUserLoginAmount = 0;
    if (userDataLogin != null)
      currentUserLoginAmount = userDataLogin.amount - amount;
    
    int currentTargetAmount = userTarget.amount + amount;

    String owed = "";
    if(currentUserLoginAmount < 0){
      owed = r"Owed $" +"${currentUserLoginAmount.abs()} to ${userTarget.name}\n";
    }

    
    await addATM(userLogin, currentUserLoginAmount);
    await addATM(userTarget.name, currentTargetAmount);

    String result = r"Transferred $"+"$amount to ${userTarget.name}\n" + r"Your balance is $"; 
            result += currentUserLoginAmount > 0 ? "$currentUserLoginAmount" : "0\n" + owed;

    return result;
  }

  @override
  Future<String> withdraw() async {
    final userLogin = await SharedPref().getUserLogin();

    final AtmModel? userDataLogin = await getAtm(userLogin);

    if(userLogin.isNotEmpty){
      return r"Your balance is $"+"${userDataLogin?.amount ?? 0}\n";
    }else{
      return "You are not login\n";
    }
  }

  @override
  Future<String> logout() async {
    final userLogin = await SharedPref().getUserLogin();
    if(userLogin.isNotEmpty){
      await SharedPref().setUserLogin("");
      return "Goodbye, $userLogin!\n";
    }else{
      return "You are not login\n";
    }
  }

  @override
  Future<void> addATM(String name, int amount) async {
    AtmModel atmModel = new AtmModel(name: name, amount: amount);
    List<AtmModel> atmUserList = await SharedPref().getAtmModelDataList(); 
    if(atmUserList.length > 0){
      atmUserList.removeWhere((element) => element.name == name);
    }
      List<AtmModel> list = [];
      list.addAll(atmUserList);
      list.add(atmModel);
      await SharedPref().setAtmModelList(list);
    
  }

  @override
  Future<AtmModel?> getAtm(String name) async{
    List<AtmModel> atmUserList = await SharedPref().getAtmModelDataList(); 
    if(atmUserList.length > 0){
      for (var item in atmUserList) {
        if(item.name == name){
          return item;
        }
      }
    }else{
      return null;
    }
  }

}