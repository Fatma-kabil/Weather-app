import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weahter_states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/homeview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                //primarySwatch: Colors.amber,
                appBarTheme: AppBarTheme(
                    color: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weathermodel
                            ?.weatherCondition)),
              ),
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.lightBlue;
  }
// Define the material color groups for similar weather conditions
  final Map<List<String>, MaterialColor> weatherColorGroups = {
    ['Sunny', 'Clear']: Colors.orange,
    ['Partly cloudy']: Colors.yellow,
    ['Cloudy', 'Overcast', 'Mist', 'Fog']: Colors.grey,
    [
      'Patchy rain possible',
      'Patchy snow possible',
      'Patchy sleet possible',
      'Patchy freezing drizzle possible',
      'Patchy light drizzle',
      'Patchy light rain'
    ]: Colors.lightBlue,
    [
      'Thundery outbreaks possible',
      'Patchy light rain with thunder',
      'Moderate or heavy rain with thunder',
      'Patchy light snow with thunder',
      'Moderate or heavy snow with thunder'
    ]: Colors.deepPurple,
    ['Blowing snow', 'Blizzard']: Colors.grey,
    [
      'Freezing fog',
      'Light freezing rain',
      'Moderate or heavy freezing rain',
      'Light sleet',
      'Moderate or heavy sleet',
      'Light showers of ice pellets',
      'Moderate or heavy showers of ice pellets'
    ]: Colors.lightBlue,
    [
      'Light drizzle',
      'Light rain',
      'Moderate rain at times',
      'Moderate rain',
      'Heavy rain at times',
      'Heavy rain',
      'Light rain shower',
      'Moderate or heavy rain shower',
      'Torrential rain shower'
    ]: Colors.lightBlue,
    [
      'Light snow',
      'Patchy light snow',
      'Patchy moderate snow',
      'Moderate snow',
      'Patchy heavy snow',
      'Heavy snow',
      'Light snow showers',
      'Moderate or heavy snow showers'
    ]: Colors.lightBlue,
  };

// Check if the condition belongs to any color group
  for (final group in weatherColorGroups.keys) {
    if (group.contains(condition)) {
      return weatherColorGroups[group]!;
    }
  }

// Return a default color if the condition is not found in any group
  return Colors.blue;
}
