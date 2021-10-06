import 'package:weather_flutter/services/location.dart';
import 'package:weather_flutter/services/networking.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Очень жарко';
    } else if (temp > 20) {
      return 'Жарко';
    } else if (temp < 10) {
      return 'Холодно';
    } else {
      return 'Нормально';
    }
  }

  Future<dynamic> getlocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    Network network = Network();
    return await network.getData(location.lat, location.lon);
  }

  Future<dynamic> getCityWeather(String city) async {
    Network network = Network();
    return await network.getCityData(city);
  }
}
