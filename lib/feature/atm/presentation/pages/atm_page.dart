import 'package:atm_simulator/core/util/sharedpref.dart';
import 'package:atm_simulator/feature/atm/presentation/blocs/atm_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AtmPage extends StatefulWidget {
  const AtmPage({ Key? key }) : super(key: key);

  @override
  _AtmPageState createState() => _AtmPageState();
}

class _AtmPageState extends State<AtmPage> {

  TextEditingController _controller = new TextEditingController();
  String result = "";

  Widget body(){
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                    ),
                    controller: _controller,
                  ),
                  SizedBox(height: 5.0,),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: (){
                        if(_controller.text.isNotEmpty){
                          BlocProvider.of<AtmBloc>(context).add(
                            AtmSubmitEvent(
                              command: _controller.text,
                            ),
                          );
                        }
                      }, 
                      child: Text("Submit")
                    )
                  ),
                ],
              ),
            ),
            Text(result),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("ATM Simulation"),
      ),
      
      body: BlocBuilder<AtmBloc, String>(
        builder: (context, atmEvent) {
          //print(atmEvent);
          result += atmEvent+"\n";
          return SingleChildScrollView(child: body());
        },
      ),
    );
  }
}