import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

// void getData() async {
//   http.Response response = await http.get(
//       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
//   if (response.statusCode == 200) {
//     String data = response.body;
//     var decodedData = jsonDecode(data);
//
//     double temperature = decodedData['main']['temp'];
//     int condition = decodedData['weather'][0]['id'];
//     String cityName = decodedData['name'];
//
//     print(condition);
//     print(cityName);
//     print(temperature);
//     // print(data);
//     // var longitude = jsonDecode(data)['coord']['lon'];
//     // print(longitude);
//     //
//     // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
//     // print(weatherDescription);
//   } else {
//     print(response.statusCode);
//   }
// }
