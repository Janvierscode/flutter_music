class AppFailure {
  AppFailure(this.message);
  final String message;

  @override
  String toString() =>
      message.isNotEmpty ? message : 'Sorry unexpected error has occurred';
}
