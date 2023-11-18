import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vader_app/model/weather_model.dart';
import 'package:vader_app/pages/current_weather.dart';
import 'package:vader_app/pages/more_info.dart';
import 'package:vader_app/services/weather_api_client.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();

  Weather? data;

  Future<void> getData() async {
    await Geolocator.requestPermission();
    await Geolocator.checkPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String latPos = position.latitude.toString();
    String lonPos = position.longitude.toString();
    data = await client.getCurrentWeather(latPos, lonPos);
    print(data!.cityName);
  }

  void getLocation() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.amber[400],
        title: const Text('Väderappen'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
          alignment: Alignment.center,
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                    "${data!.cityName}"),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  "Mer info om vädret",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                additionalInformation("${data!.wind}", "${data!.pressure}",
                    "${data!.humidity}", "${data!.feels_like}"),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go('/about');
        },
        child: Text("About"),
        backgroundColor: Colors.amber[400],
      ),
    );
  }
}
/* 
class OldHomePage extends StatelessWidget {
  const OldHomePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go('/about');
          },
          child: const Text('Go till about'),
        ),
      ),
    );
  }
} */

/* 

Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentWeather(Icons.wb_sunny_rounded, "26,3", "lessebo"),
          SizedBox(
            height: 60.0,
          ),
          Text(
            "Mer info om vädret",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          additionalInformation("22", "321", "12", "22"),
        ],
      ), */