import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monsoon/App_State.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  //Create Instance of provider


  @override
  Widget build(BuildContext context) {
    //1st Way
    // AppState provider=Provider.of<AppState>(context);
    //2nd Way


    return Scaffold(
      appBar: AppBar(
        title: Text("coding"),
      ),
      body: Center(
        child: Consumer<AppState>(builder: (context,providerValue,child){
          return Column(
            children: <Widget>[
          Text(
          "Provider Value = ${providerValue.name}",
            style: TextStyle(fontSize: 20),
          ),
              SizedBox(
                height: 100,
              ),
              CupertinoButton(
                  color: Colors.grey,
                  child: Text("Press Event"), onPressed: (){
                    providerValue.getName("After 3 sec");

              }),
            ],
          );
        })
      ),
    );
  }
}
