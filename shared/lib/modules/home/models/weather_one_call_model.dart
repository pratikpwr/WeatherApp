// To parse this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

WeatherData weatherDataFromJson(String str) =>
    WeatherData.fromJson(json.decode(str));

class WeatherData {
  WeatherData({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    // this.minutely,
    this.hourly,
    this.daily,
  });

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;

  // List<Minutely>? minutely;
  List<Current>? hourly;

  List<Daily>? daily;

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromJson(json["current"]),
        // minutely: json["minutely"] == null
        //     ? null
        //     : List<Minutely>.from(
        //         json["minutely"].map((x) => Minutely.fromJson(x))),
        hourly: json["hourly"] == null
            ? null
            : List<Current>.from(
                json["hourly"].map((x) => Current.fromJson(x))),
        daily: json["daily"] == null
            ? null
            : List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );
}

class Current {
  Current({
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

  int dt;
  int temp;
  double? feelsLike;
  int pressure;
  int humidity;
  double? dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double? windSpeed;
  double? windDeg;
  double? windGust;
  List<Weather> weather;
  double? pop;

  static int mToKm(int m) {
    final km = m / 1000;
    return km.toInt();
  }

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        temp: json["temp"].toInt(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"].toInt(),
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: mToKm(json["visibility"]),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"].toDouble(),
        windGust: json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
      );
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
}

// enum Status { clouds, snow, clear, rain, drizzle, thunderstorm }

// final mainValues = EnumValues({
//   "Clouds": Status.clouds,
//   "Snow": Status.snow,
//   "Clear": Status.clear,
//   "Rain": Status.rain,
//   "Drizzle": Status.drizzle,
//   "Thunderstorm": Status.thunderstorm
// });

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    this.dewPoint,
    this.windSpeed,
    required this.windDeg,
    this.windGust,
    required this.weather,
    required this.clouds,
    this.pop,
    this.uvi,
    this.snow,
    this.rain,
  });

  int dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double? moonPhase;
  Temp temp;
  FeelsLikeInDay feelsLike;
  int pressure;
  int humidity;
  double? dewPoint;
  double? windSpeed;
  int windDeg;
  double? windGust;
  List<Weather> weather;
  int clouds;
  double? pop;
  double? uvi;
  double? snow;
  double? rain;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase:
            json["moon_phase"] == null ? null : json["moon_phase"].toDouble(),
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLikeInDay.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint:
            json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust:
            json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
      );
}

class FeelsLikeInDay {
  FeelsLikeInDay({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? night;
  double? eve;
  double? morn;

  factory FeelsLikeInDay.fromJson(Map<String, dynamic> json) => FeelsLikeInDay(
        day: json["day"] == null ? null : json["day"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  int? day;
  int? min;
  int? max;
  int? night;
  int? eve;
  int? morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"] == null ? null : json["day"].toInt(),
        min: json["min"] == null ? null : json["min"].toInt(),
        max: json["max"] == null ? null : json["max"].toInt(),
        night: json["night"] == null ? null : json["night"].toInt(),
        eve: json["eve"] == null ? null : json["eve"].toInt(),
        morn: json["morn"] == null ? null : json["morn"].toInt(),
      );
}

class Minutely {
  Minutely({
    required this.dt,
    required this.precipitation,
  });

  int dt;
  int precipitation;

  factory Minutely.fromJson(Map<String, dynamic> json) => Minutely(
        dt: json["dt"],
        precipitation: json["precipitation"],
      );
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    // if (reverseMap == null) {
    //   reverseMap = map.map((k, v) => new MapEntry(v, k));
    // }
    return reverseMap ?? map.map((k, v) => MapEntry(v, k));
  }
}
