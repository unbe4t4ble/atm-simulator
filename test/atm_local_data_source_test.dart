import 'package:atm_simulator/core/util/sharedpref.dart';
import 'package:atm_simulator/feature/atm/data/datasources/atm_local_data_source.dart';
import 'package:atm_simulator/feature/atm/data/models/atm_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AtmLocalDataSourceImpl atmLocalDataSourceImpl;
  setUp(() {
    atmLocalDataSourceImpl = AtmLocalDataSourceImpl();
  });

  group("login", () {
    test("should return same result string", () async {
      final AtmModel? atmModel = await atmLocalDataSourceImpl.getAtm("ayu");
      final String expResult = "Hello, ${atmModel?.name}!\n" + r"Your balance is $" + "${atmModel?.amount}";
      // act
      final actResult = await atmLocalDataSourceImpl.login(atmModel?.name ?? "");
      // assert
      expect(actResult, expResult);
    });
  });

  group("logout", () {
    test("should return same result string", () async {
      final AtmModel atmModel = AtmModel(name: 'ayu', amount: 0);
      final String expResult = "Goodbye, ${atmModel.name}!\n";
      // act
      final actResult = await atmLocalDataSourceImpl.logout();      // assert
      expect(actResult, expResult);
    });
  });

  group("withdraw", () {
    test("should return same result string", () async {
      await SharedPref().setUserLogin("ayu");
      final AtmModel? atmModel = await atmLocalDataSourceImpl.getAtm("ayu");
      final String expResult = r"Your balance is $"+"${atmModel?.amount}\n";
      
      // act
      final actResult = await atmLocalDataSourceImpl.withdraw();      // assert
      expect(actResult, expResult);
    });
  });

  group("deposit", () {
    test("should return same result string", () async {
      await SharedPref().setUserLogin("ayu");
      final AtmModel? atmModel = await atmLocalDataSourceImpl.getAtm("ayu");
      final String expResult = r"Your balance is $"+"${atmModel?.amount}";
      
      // act
      final actResult = await atmLocalDataSourceImpl.deposit(atmModel?.amount ?? 0);      // assert
      expect(actResult, expResult);
    });
  });

  group("trasfer", () {
    test("should return same result string", () async {
      await SharedPref().setUserLogin("ayu");
      final AtmModel? userlogin = await atmLocalDataSourceImpl.getAtm("ayu");
      final AtmModel? userTarget = await atmLocalDataSourceImpl.getAtm("amel");
      if(userTarget == null){
        await atmLocalDataSourceImpl.addATM("amel", 0);
      }
      int amount = 100;

      int currentUserLoginAmount = 0;
      if (userlogin != null){
        currentUserLoginAmount = userlogin.amount - amount;
      }
    
      String expResult = r"Transferred $"+"$amount to ${userTarget?.name}\n" + r"Your balance is $"; 
            expResult += currentUserLoginAmount > 0 ? "$currentUserLoginAmount" : "0\n";
      
      // act
      final actResult = await atmLocalDataSourceImpl.transfer(userTarget?.name ?? "", amount);      // assert
      expect(actResult, expResult);
    });
  });


  

  
}