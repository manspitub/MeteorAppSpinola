import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meteor_app_spinola/data_service.dart';

import 'package:meteor_app_spinola/models/clime.dart';
import 'package:meteor_app_spinola/models/weather.dart';
import 'package:http/http.dart' as http;

import 'models/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final DateTime now = DateTime.now();

  static final DateFormat formatter = DateFormat('HH:MM - EEEE, d MMM y');
  final String formattednow = formatter.format(now);  

  final String morningBackground =
      'https://images.unsplash.com/photo-1415750465391-51ed29b1e610?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG1vcm5pbmd8ZW58MHx8MHx8&w=1000&q=80';
  final String eveningBackground =
      'https://images.unsplash.com/photo-1472120435266-53107fd0c44a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZXZlbmluZ3xlbnwwfHwwfHw%3D&w=1000&q=80';
  final String nightBackground =
      'https://s1.dmcdn.net/v/IUNr81OHlmM0jS8wI/x1080';

  Image getBackground() {
    if (now.hour > 7 && now.hour < 14) {  
      return Image.network(
        morningBackground,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else if (now.hour > 14 && now.hour < 21) {
      return Image.network(
        eveningBackground,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else {
      return Image.network(nightBackground,
          fit: BoxFit.cover, width: double.infinity, height: double.infinity);
    }
  }

  Icon getIcon() {
    if (now.hour > 7 && now.hour < 20) {
      return Icon(
        Icons.wb_sunny_sharp,
        color: Colors.yellow,
        size: 30,
      );
    } else {
      return Icon(
        Icons.nights_stay,
        color: Colors.white,
        size: 30,
      );
    }
  }

  getDayState() {
    if (now.hour > 7 && now.hour < 20) {
      return "Day";
    } else {
      return "Night";
    }
  }

  final _cityTextController = TextEditingController();
  final _dataService = DataServiceWeather();


  late WeatherResponse? _response = null;

  

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);

    setState(() => _response = response);


  }

  Future <List<Hourly>> getClime(String lat, String lon) async {
    String apiKey = "aabaacf9f2d7e0e1d88180b9f5eb83d5";
    

    var url = "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,daily&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return ClimeResponse.fromJson(jsonDecode(response.body)).hourly;
  } else {
    throw Exception('Failed to load hourly weather');
  }
  }

  

  getWeatherIcon() {
    if (_response!.iconUrl == "https://openweathermap.org/img/wn/01d@2x.png" ||
        _response!.iconUrl == "https://openweathermap.org/img/wn/01n@2x.png") {
      return Image.network(
        "https://cdn-icons-png.flaticon.com/512/169/169367.png",
        width: 70,

      );
    } else {
      return Image.network(_response!.iconUrl, width: 50,);
    }
  }

  _getSunriseDateTime() {
    final timestamp = _response!.sys.sunrise;

    final DateTime sunriseDate =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    final DateFormat formatter = DateFormat('HH:MM');
    final String formatted = formatter.format(sunriseDate);

    return formatted;
  }

  _getSunsetDateTime() {
    final timestamp = _response!.sys.sunset;

    final DateTime sunriseDate =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    final DateFormat formatter = DateFormat('HH:MM');
    final String formatted = formatter.format(sunriseDate);

    return formatted;
  }

  /*Widget _hourlyList(){
    return SizedBox(

      height: 270,

      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index){
          return 
        },
      ),

    );
  }*/

 /* Widget hourlyItem(){
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,

      children: <Widget>[
        Container(

          margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
          height: 110.0,
          width: 110,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(110.0),
            border: Border.all(
              color: Colors.yellow,
              width: 2.0
            )
          ),
          child: ClipOval(
            child: 
          ),
          
        )
      ],
    )
  }*/

  getTimefromTimestamp(int timestamp){
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = new DateFormat('HH:MM a');
    return formatter.format(date);
  }
  Widget viewsHourly(List<Hourly> hourly){

    return SizedBox(

      height: 152,

      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index){
          return hourlyItem(hourly.elementAt(index),index);
        },
      ),
    );
    

    
  }

  Widget hourlyItem(Hourly hourly, int index){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      height: 50,
      child: 
          Container(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 15, right: 10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0,1 ),
                )
              ]
            ),
            child: Column(children: [
              Text(hourly.temp.toString()+" ºC",
              style: GoogleFonts.lato(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.black),),
              getWeatherIcon(),
              Text(
                getTimefromTimestamp(hourly.dt),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey
                ),

            
            )],),
    ));
        
           
      
      
  }
  late Future<List<Hourly>> items = getClime(_response!.coord.lat.toString(), _response!.coord.lon.toString());


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: TextField(
          autocorrect: true,
          style: TextStyle(color: Colors.white, fontSize: 20),
          controller: _cityTextController,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          alignment: Alignment.centerRight,
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          onPressed: _search,
        ),
        actions: [Icon(Icons.change_circle)],
      ),
      body: Container(
        child: Stack(
          children: [
            getBackground(),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            if (_response != null)
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                '${_response?.cityName}'', ''(${_response!.sys.country})',
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                formattednow.toString(),
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            
                          ),
                          Column(
                            children: <Widget>[

                              Center(child: FutureBuilder<List<Hourly>>(
                                future: items,
                                builder: ((context, snapshot) {
                                  if (snapshot.hasData) {
                                    return viewsHourly(snapshot.data!);
                                  } else if(snapshot.hasError){
                                    return Text('${snapshot.error}');
                                  }

                                  return const CircularProgressIndicator();
                                }),
                              ),)


                            ]
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_response?.tempInfo.temperature} ºC (Ahora)' ,
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                             
                              Row(
                                children: [
                                  getWeatherIcon(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _response!.weatherInfo.description,
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/578/578154.png",
                                    width: 30,
                                  ),
                                  
                                  Text(
                                    _getSunriseDateTime(),
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/3226/3226463.png",
                                    width: 30,
                                  ),
                                  
                                  Text(
                                    _getSunsetDateTime(),
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 40),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.white30,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Wind',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    _response!.wind.speed.toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'km/h',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 10,
                                    child: Icon(
                                      Icons.air,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Pressure',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    _response!.main.pressure.toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'pa',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                      width: 50,
                                      height: 10,
                                      child: Icon(
                                        Icons.thermostat,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Humidity',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    _response!.main.humidity.toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '%',
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 10,
                                    child: LinearProgressIndicator(
                                      value: _response!.main.humidity / 100,
                                      backgroundColor: Colors.red,
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.blue),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
