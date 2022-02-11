class ClimeResponse {
  ClimeResponse({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
  });
  late final double lat;
  late final double lon;
  late final String timezone;
  late final int timezoneOffset;
  late final Current current;
  late final List<Hourly> hourly;
  
  ClimeResponse.fromJson(Map<String, dynamic> json){
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current = Current.fromJson(json['current']);
    hourly = List.from(json['hourly']).map((e)=>Hourly.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['timezone'] = timezone;
    _data['timezone_offset'] = timezoneOffset;
    _data['current'] = current.toJson();
    _data['hourly'] = hourly.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Current {
  Current({
    required this.dt,

    required this.temp,
    required this.feelsLike,
    required this.pressure,

    required this.visibility,

    required this.weather,
  });
  late final int dt;
  
  late final double temp;
  late final double feelsLike;
  late final int pressure;
  


  late final int visibility;

  late final List<Weather> weather;
  
  Current.fromJson(Map<String, dynamic> json){
    dt = json['dt'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    weather = List.from(json['weather']).map((e)=>Weather.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['visibility'] = visibility;
    _data['weather'] = weather.map((e)=>e.toJson()).toList();
    return _data;
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

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${icon}@2x.png';
  }
}

class Hourly {
  Hourly({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.clouds,
    required this.visibility,
    required this.windDeg,
    required this.weather,
  });
  late final int dt;
  late final double temp;
  late final double feelsLike;
  late final int pressure;
  late final int humidity;
  late final double? dewPoint;
  late final int clouds;
  late final int visibility;
  late final int windDeg;
  late final List<Weather> weather;
  
  Hourly.fromJson(Map<String, dynamic> json){
    dt = json['dt'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windDeg = json['wind_deg'];
    weather = List.from(json['weather']).map((e)=>Weather.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['dew_point'] = dewPoint;
    _data['clouds'] = clouds;
    _data['visibility'] = visibility;
    _data['wind_deg'] = windDeg;
    _data['weather'] = weather.map((e)=>e.toJson()).toList();
    return _data;
  }
}