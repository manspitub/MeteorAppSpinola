


class Hourly {
  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });
  late final int dt;
  late final double temp;
  late final double feelsLike;
  late final int pressure;
  late final int humidity;
  late final double dewPoint;
  late final int? uvi;
  late final int clouds;
  late final int visibility;
  late final double? windSpeed;
  late final int windDeg;
  late final double windGust;
  late final List<Weather> weather;
  late final int? pop;
  
  Hourly.fromJson(Map<String, dynamic> json){
    dt = json['dt'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    weather = List.from(json['weather']).map((e)=>Weather.fromJson(e)).toList();
    pop = json['pop'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['uvi'] = uvi;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_speed'] = windSpeed;
    _data['wind_deg'] = windDeg;
    _data['wind_gust'] = windGust;
    _data['weather'] = weather.map((e)=>e.toJson()).toList();
    _data['pop'] = pop;
    return _data;
  }
}

class ClimeResponse {
   late final List<Hourly> hourly;


  ClimeResponse({required this.hourly});

  factory ClimeResponse.fromJson(Map<String, dynamic> json) {
    

    final hourlyJson = json['hourly'];
    final hourly = List.from(hourlyJson).map((e) => Hourly.fromJson(e)).toList();

    

    return ClimeResponse(
        hourly: hourly);
  }
}



class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final int id;
  late final String main;
  late final String description;
  late final String icon;
  
  Weather.fromJson(Map<String, dynamic> json){
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}