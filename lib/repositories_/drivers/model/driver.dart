class Driver {
  final String name;
  final bool isDriving;
  final String location;

  const Driver(this.name, this.isDriving, this.location);
}

class User {
  final String name;

  User(this.name);
}

class Tomador extends User {
  Tomador(String name) : super(name);
}
