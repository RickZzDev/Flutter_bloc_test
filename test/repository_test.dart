import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fs_checklist/repositories_/drivers/drivers_repository.dart';
import 'package:fs_checklist/repositories_/drivers/model/driver.dart';
import 'package:fs_checklist/repositories_/weather/model/weather.dart';
import 'package:fs_checklist/repositories_/weather/weather_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  FakeDriversRepository driversRepository;
  FakeWeatherRepository weatherRepository;
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    driversRepository = FakeDriversRepository();
    weatherRepository = FakeWeatherRepository();
  });

  test(
    "Verify if returns a Driver intance",
    () async {
      Driver data = await driversRepository.getDriverById("", "");
      expect(
        data,
        isInstanceOf<Driver>(),
      );
    },
  );
  test(
    "Verify if returns a List of Drivers intance",
    () async {
      List<Driver> data = await driversRepository.getDrivers("");
      expect(
        data,
        isInstanceOf<List<Driver>>(),
      );
    },
  );

  test(
    "Verify if returns a Weather intance",
    () async {
      Weather data = await weatherRepository.fetchWeather("");
      expect(
        data,
        isInstanceOf<Weather>(),
      );
    },
  );
}
