part of 'drivers_cubit.dart';

@immutable
abstract class DriversState {
  const DriversState();
}

class DriversInitial extends DriversState {
  const DriversInitial();
}

class DriversLoading extends DriversState {
  const DriversLoading();
}

class DriversLoaded extends DriversState {
  final Driver driver;
  final List<Driver> drivers;

  DriversLoaded({this.driver, this.drivers});
}

class DriversError extends DriversState {
  final String message;

  DriversError(this.message);
}
