import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fs_checklist/interface/weather/weather_cubit.dart';
import 'package:fs_checklist/presentation/widgets/core/custom_input_text_field.dart';
import 'package:fs_checklist/presentation/widgets/core/custom_scaffold.dart';
import 'package:fs_checklist/repositories_/weather/model/weather.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is WeatherInitial) {
            return _buildInitial(context);
          } else if (state is WeatherLoading) {
            return _buildLoading();
          } else if (state is WeatherLoaded) {
            return _buildData(state.weather);
          } else {
            return _buildInitial(context);
          }
        },
      ),
    );
  }

  void onSubmit(BuildContext context, String v) {
    try {
      final WeatherCubit weatherCubit = BlocProvider.of<WeatherCubit>(context);
      // final WeatherCubit weatherCubit = BlocProvider.of<WeatherCubit>(context);
      weatherCubit.getWeather(v.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 50,
          ),
        ),
        Text(
          weather.cityTemperature.toString(),
          style: TextStyle(
            fontSize: 50,
          ),
        ),
        CustomInputTextField(
          onSubmitted: (v) => onSubmit(context, v),
          hintText: "Insira uma cidade",
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildInitial(BuildContext context) {
    return Center(
      child: CustomInputTextField(
        onSubmitted: (v) => onSubmit(context, v),
        hintText: "Insira uma cidade",
      ),
    );
  }
}
