import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fs_checklist/interface/drivers/drivers_cubit.dart';
import 'package:fs_checklist/repositories_/drivers/drivers_repository.dart';
import 'package:mockito/mockito.dart';

class SpyDriversRepository extends Mock implements FakeDriversRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  DriversCubit driversCubit;
  SpyDriversRepository driversRepository;
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    driversRepository = SpyDriversRepository();
    driversCubit = DriversCubit(driversRepository);
  });

  test(
    "Verify if cubit is calling getDrivers",
    () async {
      await driversCubit.getDriversList("");
      verify(driversRepository.getDrivers(""));
    },
  );

  test(
    "Verify if cubit is calling getDriversById ",
    () async {
      await driversCubit.getDriverById("", "");
      verify(driversRepository.getDriverById("", ""));
    },
  );

  test(
    "Verify if cubit.getDriversById is calling right states ",
    () async {
      expectLater(
        driversCubit,
        emitsInOrder(
          [
            isInstanceOf<DriversInitial>(),
            isInstanceOf<DriversLoading>(),
            isInstanceOf<DriversLoaded>()
          ],
        ),
      );
      await driversCubit.getDriverById("", "");

    },
  );

  test(
    "Verify if cubit.getDriversById is calling error state ",
    () async {
      when(driversRepository.getDriverById("", "")).thenThrow(Exception());
      expectLater(
        driversCubit,
        emitsInOrder(
          [
            isInstanceOf<DriversInitial>(),
            isInstanceOf<DriversLoading>(),
            isInstanceOf<DriversError>()
          ],
        ),
      );

      await driversCubit.getDriverById("", "");
    },
  );

  test(
    "Verify if cubit.getDriversList is calling right states ",
    () async {
      expectLater(
          driversCubit,
          emitsInOrder(
            [
              isInstanceOf<DriversInitial>(),
              isInstanceOf<DriversLoading>(),
              isInstanceOf<DriversLoaded>()
            ],
          ));
      await driversCubit.getDriversList("");
      // verify(driversRepository.getDriverById("", ""));
    },
  );

  test(
    "Verify if cubit.getDriversList is calling error state ",
    () async {
      when(driversRepository.getDrivers("")).thenThrow(Exception());
      expectLater(
        driversCubit,
        emitsInOrder(
          [
            isInstanceOf<DriversInitial>(),
            isInstanceOf<DriversLoading>(),
            isInstanceOf<DriversError>()
          ],
        ),
      );

      await driversCubit.getDriversList("");
    },
  );
}
