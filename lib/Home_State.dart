import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:monsoon/App_State.dart';
import 'package:monsoon/UI_Widget/first_page.dart';
import 'package:monsoon/UI_Widget/secont_page.dart';
import 'package:provider/provider.dart';

class HomeState extends StatelessWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppState>(context,listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(CupertinoIcons.arrow_up_arrow_down_circle),
      onPressed: (){
        appProvider.updateWidget();
    },
      backgroundColor: Colors.blueGrey,
      ),
      appBar: AppBar(
        title: const Text("DEMO"),

      ),
      body: Consumer<AppState>(builder: (context,provider,child){
        return provider.change ? SecondPage(): FirstPage();
      }),
    );
  }
}
