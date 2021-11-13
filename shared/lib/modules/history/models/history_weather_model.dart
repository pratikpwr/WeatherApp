class WeatherData {
  WeatherData({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
  });

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;

  List<Current> hourly;

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromJson(json["current"]),
        hourly:
            List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
      );
}

class Current {
  Current({
    required this.dt,
    this.sunrise,
    this.sunset,
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
  int? sunrise;
  int? sunset;
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
        sunrise: json["sunrise"],
        sunset: json["sunset"],
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
