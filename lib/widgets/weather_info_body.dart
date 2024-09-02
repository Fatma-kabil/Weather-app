import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weathermodel!;
    String image = weathermodel.image.contains("https")
        ? weathermodel.image
        : "https:${weathermodel.image}";
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            getThemeColor(weathermodel.weatherCondition),
            getThemeColor(weathermodel.weatherCondition)[400]!,
            getThemeColor(weathermodel.weatherCondition)[50]!
          ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
                "Updated at ${weathermodel.date.hour}:${weathermodel.date.minute}",
                style: const TextStyle(fontSize: 19)),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  image,
                  height: 100,
                  width: 100,
                ),
                Text(
                  weathermodel.temp.round().toString(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      "Maxtemp : ${weathermodel.maxTemp.round()}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Mintemp : ${weathermodel.minTemp.round()}",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              weathermodel.weatherCondition,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
