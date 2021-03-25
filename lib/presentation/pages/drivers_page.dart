import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fs_checklist/interface/drivers/drivers_cubit.dart';
import 'package:fs_checklist/presentation/widgets/core/custom_scaffold.dart';
import 'package:fs_checklist/repositories_/drivers/model/driver.dart';

class DriversPage extends StatefulWidget {
  @override
  _DriversPageState createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  @override
  void initState() {
    initPage();
    super.initState();
  }

  void initPage() {
    final DriversCubit driversCubit = BlocProvider.of<DriversCubit>(context);
    driversCubit.getDriversList("290");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          BlocConsumer<DriversCubit, DriversState>(
            listener: (context, state) {
              if (state is DriversError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is DriversInitial) {
                return _loading();
              } else if (state is DriversLoading) {
                return _loading();
              } else if (state is DriversLoaded) {
                if (state.driver == null) {
                  return _driversListView(state.drivers);
                } else {
                  return _singleDriverView(state.driver);
                }
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _driversListView(List<Driver> drivers) {
    List<Widget> driversWidget = [];

    drivers.forEach(
      (element) {
        driversWidget.add(
          Container(
            color: Colors.blueAccent,
            margin: EdgeInsets.all(20),
            child: Text(
              "${element.name} ${element.isDriving ? "esta dirigindo" : "esta parado"} em ${element.location}",
            ),
          ),
        );
      },
    );

    return Column(
      children: driversWidget,
    );
  }

  Widget _singleDriverView(Driver driver) {
    return Container(
      color: Colors.blueAccent,
      margin: EdgeInsets.all(20),
      child: Text(
        "${driver.name} ${driver.isDriving ? "esta dirigindo" : "esta parado"} em ${driver.location}",
      ),
    );
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
