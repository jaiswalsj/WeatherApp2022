import 'package:flutter/material.dart';
import 'package:monsoon/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String city = "Jabalpur";
  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

  void startApp(String city)async
  {
    worker instance = worker(location: city);
    await instance.fatchData();
    temp = instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    description = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 1),(){
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temp_value" : temp,
        "hum_value" : humidity,
        "air_speed_value" : air_speed,
        "main_value" : main,
        "des_value" : description,
        "icon_value" : icon,
        "city_value" : city,
      }
      );
    });


  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map ? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if(search?.isNotEmpty ?? false)
      {
        city = search!['searchText'];
      }
    startApp(city);

    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  SizedBox(height: 250,),
              Image.asset("assets/clouds.png",height: 120,width: 120,

              ),

              SizedBox(
                height: 20,
              ),
              Text("Mousam App",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
              ),
              Text("Made by SJ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white

                  ),
              ),
              SizedBox(
                height: 30,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
