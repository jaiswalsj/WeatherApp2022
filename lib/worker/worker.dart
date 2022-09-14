import 'package:http/http.dart' as http;
import 'dart:convert';


class worker{

  late String location;

  //constructor method
  worker({required this.location})
  {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;



  Future<void> fatchData()async{

    try{
      var res = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=5ef52421e37107bf264bf617805d74ea"));
      Map data = jsonDecode(res.body);
      print(data);

      //getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc= weather_main_data['description'];

      //getting Temp,Humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      //getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind['speed']/ 0.2777777778;

      // print(weather_data);
      // print(weather_main_data['main']);
      // print(temp);


      //Assigning values
      temp= getTemp.toString();   //C
      humidity= getHumidity;    //%
      air_speed = getAir_speed.toString();    //km/hr
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data['icon'].toString();

    }catch(e)
    {
      temp= "EMT";
      humidity= "EMT";
      air_speed = "EMT";
      description = "Can't find data";
      main = "EMT";
      icon = "50d";
    }


  }
}

