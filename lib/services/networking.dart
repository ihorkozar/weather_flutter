import 'dart:convert';
import 'package:http/http.dart';

const apiKey = '69fa176e0b9e4c0aebe0cea100aa629d';
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class Network {
  Future getData(double lat, double lon) async {
    Response response = await get(Uri.parse(
        '$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print(response.statusCode);
    }
  }

  Future getCityData(String city) async {
    Response response = await get(Uri.parse(
        '$baseUrl?q=$city&appid=$apiKey&units=metric'));
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print(response.statusCode);
    }
  }
}
