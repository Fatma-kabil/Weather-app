import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weahter_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weathermodel;
  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadingState());
      weathermodel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weathermodel!));
    } on Exception catch (e) {
      emit(WeatherFauilreState(e.toString()));
    }
  }
}
