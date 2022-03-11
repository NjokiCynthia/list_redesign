part of list_redesign_models;

class Failure implements Exception {
  Failure({
    required this.message,
  });

  final String message;
}