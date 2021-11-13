import 'package:shared/modules/home/home.dart';

class CityWeather {
  CityWeather({
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.sys,
    required this.name,
  });

  List<Weather> weather;
  Main main;
  int visibility;
  double wind;
  int clouds;
  Sys sys;
  String name;

  factory CityWeather.fromJson(Map<String, dynamic> json) => CityWeather(
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"].toInt(),
        wind: json["wind"]["speed"].toDouble(),
        clouds: json["clouds"]["all"].toInt(),
        sys: Sys.fromJson(json["sys"]),
        name: json["name"],
      );
}

class Main {
  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });

  int temp;
  int tempMin;
  int tempMax;
  double feelsLike;
  int pressure;
  int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toInt(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toInt(),
        tempMax: json["temp_max"].toInt(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );
}

class Sys {
  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
}
