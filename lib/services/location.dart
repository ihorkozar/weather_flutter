import 'package:geolocator/geolocator.dart';

class Location{
  late double lat;
  late double lon;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      lon = position.longitude;
      print(position);
    }catch(e){
      print(e);
    }
  }
}