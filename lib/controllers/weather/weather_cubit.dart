import 'package:bloc/bloc.dart';
import 'package:fs_checklist/repositories_/weather/model/weather.dart';
import 'package:fs_checklist/repositories_/weather/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final _weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(_weather));
    } catch (e) {
      emit(
        WeatherError("Algo deu errado!"),
      );
    }
  }
}
