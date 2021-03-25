class Weather {
  final String cityName;
  final double cityTemperature;

  Weather(this.cityName, this.cityTemperature);

  @override
  bool operator ==(Object other) {
    return other is Weather &&
        other.cityTemperature == cityTemperature &&
        other.cityName == cityName;
  }

  @override
  int get hashCode => cityName.hashCode + cityTemperature.hashCode;
}
