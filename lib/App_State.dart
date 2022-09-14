import 'dart:async';

import 'package:flutter/material.dart';

class AppState extends ChangeNotifier{
  int temp = 40;
  void updateTemp(int temp){
    this.temp = temp;
    notifyListeners();
  }
  //Timer function
    int start=0;
    void updateStart(int start){
      this.start = start;
      notifyListeners();
    }

    void getTimer(){
      Timer.periodic(Duration(seconds: 1), (timer){
        updateStart(timer.tick);
      });
    }

    //Provider with Async
    String name = "Shrevin";
    void updateName(String name){
      this.name = name;
      notifyListeners();
    }

    Future<void> getName(String name)async{
      Future.delayed(Duration(seconds: 3),(){
        updateName(name);
      });
    }

    //Change the Widget
    bool change = false;
    void updateWidget(){
      change = !change;
      notifyListeners();
    }


}