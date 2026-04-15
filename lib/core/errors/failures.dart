abstract class Failures {
  final String message;

  Failures({required this.message});
}

class ServerFailur extends Failures {
  ServerFailur({required super.message});
}
