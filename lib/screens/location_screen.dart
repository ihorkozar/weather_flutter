import 'package:flutter/material.dart';
import 'package:weather_flutter/screens/city_screen.dart';
import 'package:weather_flutter/util/constants.dart';
import 'package:weather_flutter/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp = 1;
  String weatherIcon = '';
  String weatherMsg = '';
  String city = '';
  WeatherModel _weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateData(widget.locationWeather);
  }

  void updateData(dynamic data) {
    if (data == null) {
      temp = 0;
      weatherIcon = 'Error';
      weatherMsg = 'Unable to get data';
      city = '';
      return;
    }
    temp = (data['main']['temp']).toInt();
    var condition = data['weather'][0]['id'];
    city = data['name'];
    weatherIcon = _weatherModel.getWeatherIcon(condition);
    weatherMsg = '${_weatherModel.getMessage(temp)} in $city';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData =
                          await _weatherModel.getlocationWeather();
                      updateData(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      var name = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if(name != null){

                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherMsg,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
