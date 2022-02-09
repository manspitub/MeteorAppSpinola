class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });
  late final double speed;
  late final int deg;
  
  Wind.fromJson(Map<String, dynamic> json){
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;
    return _data;
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo; 
  final WeatherInfo weatherInfo;
  final Wind wind;
  

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({ required this.cityName, required this.tempInfo, required this.weatherInfo, required this.wind});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final windJson = json['wind'];
    final wind = Wind.fromJson(windJson);

    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo, wind: wind);
  }
}