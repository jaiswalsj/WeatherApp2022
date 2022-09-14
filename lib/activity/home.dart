// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("This is a init State");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("SET state called");
  }

  @override
  void dispose() {
    super.dispose();
    print("Dispose called");
  }

  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String temp = ((info!["temp_value"]).toString());
    String air = ((info["air_speed_value"]).toString());

    if(temp == "EMT")
      {
        print("EMT");
      }
    else{
      temp = ((info["temp_value"]).toString()).substring(0,4);
      air = ((info["air_speed_value"]).toString()).substring(0,4);
    }


    String icon = info['icon_value'];
    String city = info['city_value'];
    String hum = info['hum_value'];
    String des = info['des_value'];


    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.redAccent,
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.pink, Colors.orange])),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(_searchController.text.replaceAll("", "") =="")
                            {
                              print("NO RESULT");
                            }
                          else{
                            Navigator.pushReplacementNamed(context, "/loading",arguments: {
                              "searchText" : _searchController.text,
                            });
                          }

                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 14, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search any city name",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.all(0.2),
                          child: Row(
                            children: [
                              Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                              SizedBox(width:20,),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("$des",style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text("$city",style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            SizedBox(height: 60),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$temp",
                                  style: TextStyle(fontSize: 95),
                                ),
                                Text(
                                  "C",
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                        padding: EdgeInsets.all(26),
                        height: 180,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.day_windy)],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "$air",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "km/h",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        padding: EdgeInsets.all(25),
                        height: 180,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.humidity)],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "$hum",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Percent",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made By SAPAN",style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),),
                      Text("Data provided by OpenWeather API")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //
    // appBar: AppBar(
    //
    //   title: Text("Home Activity"),
    // ),
    //
    // body: Column(
    //  children: <Widget>[
    //    FloatingActionButton(
    //        onPressed: () {},
    //    ),
    //    Text(info!['temp_value'])
    //  ],
    // ),
    // );
  }
}
