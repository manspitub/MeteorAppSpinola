

import 'package:meteor_app_spinola/models/clime.dart';


class Forecast {
  final List<Hourly> hourly;


  Forecast({required this.hourly});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['hourly'];


    List<Hourly> hourly = <Hourly>[];


    hourlyData.forEach((item) {
      var hour = Hourly.fromJson(item);
      hourly.add(hour);
    });
    
   
    
    return Forecast(
      hourly: hourly,

    );
  }
}