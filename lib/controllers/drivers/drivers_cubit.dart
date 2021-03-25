import 'package:bloc/bloc.dart';
import 'package:fs_checklist/repositories_/drivers/drivers_repository.dart';
import 'package:fs_checklist/repositories_/drivers/model/driver.dart';
import 'package:meta/meta.dart';

part 'drivers_state.dart';

class DriversCubit extends Cubit<DriversState> {
  final DriversRepository _driversRepository;

  DriversCubit(this._driversRepository) : super(DriversInitial());

  Future<void> getDriverById(String currentUser, String driverId) async {
    try {
      emit(DriversInitial());
      emit(DriversLoading());
      final Driver driver =
          await _driversRepository.getDriverById(currentUser, driverId);
      emit(
        DriversLoaded(driver: driver),
      );
    } catch (e) {
      emit(
        DriversError("Algo deu errado! Não achamos este motorista."),
      );
    }
  }

  Future<void> getDriversList(String currentUser) async {
    try {
      emit(DriversInitial());
      emit(DriversLoading());
      final List<Driver> drivers =
          await _driversRepository.getDrivers(currentUser);
      emit(
        DriversLoaded(drivers: drivers),
      );
    } catch (e) {
      emit(
        DriversError("Algo deu errado! Não achamos estes motoristas."),
      );
    }
  }
}
