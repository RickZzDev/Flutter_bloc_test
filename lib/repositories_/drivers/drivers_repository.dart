import 'package:fs_checklist/repositories_/drivers/model/driver.dart';

abstract class DriversRepository {
  Future<List<Driver>> getDrivers(String currentUser);
  Future<Driver> getDriverById(String currentUser, String driverId);
}

class FakeDriversRepository implements DriversRepository {
  @override
  Future<Driver> getDriverById(String currentUser, String driverId) {
    return Future.delayed(
      Duration(seconds: 2),
      () => Driver("Claudio", true, "Belo Horizonte"),
    );
  }

  @override
  Future<List<Driver>> getDrivers(String currentUser) {
    return Future.delayed(
      Duration(seconds: 4),
      () => [
        Driver("Paulo", true, "São Paulo"),
        Driver("Douglas", false, "Londrina"),
        Driver("Fabio", false, "Bahia"),
        Driver("Natan", true, "Brasilia"),
        Driver("Lucas", true, "Belo Horizonte"),
      ],
    );
  }
}
