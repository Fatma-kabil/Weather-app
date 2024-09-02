import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weahter_states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/error_body.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey,
          elevation: 2,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ))
          ],
          //    backgroundColor: const Color.fromARGB(255, 89, 178, 251),
          title: const Text(
            'Weather App',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadingState) {
              return const Center(
                  child: SpinKitFadingCircle(
                color: Colors.blueGrey,
                size: 50.0,
              ));
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(
                weather: state.weatherModel,
              );
            } else {
              return const ErrorBody();
            }
          },
        ));
  }
}
