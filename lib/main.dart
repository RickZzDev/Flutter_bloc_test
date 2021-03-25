import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fs_checklist/interface/drivers/drivers_cubit.dart';
import 'package:fs_checklist/interface/weather/weather_cubit.dart';
import 'package:fs_checklist/presentation/pages/weather_page.dart';
import 'package:fs_checklist/repositories_/drivers/drivers_repository.dart';
import 'package:fs_checklist/repositories_/weather/weather_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherCubit(FakeWeatherRepository()),
        ),
        BlocProvider(
          create: (context) => DriversCubit(FakeDriversRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Fake Weather',
        home: WeatherPage(),
      ),
    );
  }
}
