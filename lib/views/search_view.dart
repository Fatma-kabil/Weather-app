import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          // backgroundColor: const Color.fromARGB(255, 89, 178, 251),
          title: const Text(
            'Search City',
            style: TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
                child: TextField(
                    onSubmitted: (value) async {
                      var getWeatherCubit =
                          BlocProvider.of<GetWeatherCubit>(context)
                              .getWeather(cityName: value);
                      Navigator.pop(context);
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 28.0, horizontal: 16.0),
                      labelText: 'Search',
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amberAccent,
                        ),
                      ),
                    )))));
  }
}
