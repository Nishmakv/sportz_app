import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  WeatherFactory? wf;
  Weather? weatherData;
  double? longitude;
  double? latitude;
  bool isLoading = true;
  List<Weather>? forecast;
  
  List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentPosition() async {
    await _determinePosition().then((value) => {
          setState(() {
            longitude = value.longitude;
            latitude = value.latitude;
          })
        });
    await wf!
        .currentWeatherByLocation(latitude!, longitude!)
        .then((value) => setState(() {
              weatherData = value;
            }));
    forecast = await wf!.fiveDayForecastByLocation(latitude!, longitude!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    wf = WeatherFactory("3247a2285a183d9caa5d4be9769c9f12",
        language: Language.ENGLISH);
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: const Color.fromARGB(31, 220, 217, 217),
            highlightColor: Colors.white,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            height: 160,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ))),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Container(
                            height: 160,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ))),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 160,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.038),
                      blurRadius: 12,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(19, 145, 145, 145),
                  ),
                ),
                height: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${weekdays[DateTime.now().weekday - 1]} , ${TimeOfDay.now().format(context)}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        Text(
                            '${weatherData?.temperature?.celsius!.toStringAsFixed(0)}°',
                            style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 15, 177, 21),
                                leadingDistribution:
                                    TextLeadingDistribution.even)),
                        Text(weatherData!.areaName!,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Image.network(
                        "https://openweathermap.org/img/wn/${weatherData?.weatherIcon}@2x.png")
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 170,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: Container(
                          width: 120,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.038),
                                blurRadius: 12,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color.fromARGB(19, 145, 145, 145),
                            ),
                          ),
                          height: 170,
                          child: Column(
                            children: [
                              Text(DateFormat('E, HH:mm ')
                                  .format(forecast![index].date!)),
                              Image.network(
                                  "https://openweathermap.org/img/wn/${forecast![index].weatherIcon!}@2x.png"),
                              Text(
                                '${forecast![index].temperature!.celsius!.toStringAsFixed(0)}°',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: forecast!.length),
              )
            ],
          );
  }
}
