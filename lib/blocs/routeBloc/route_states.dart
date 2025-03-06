class RouteStates {
  RouteStates({
    this.path,
  });

  String? path;

  RouteStates copyWith({
    String? path,
  }) {
    return RouteStates(
      path: path ?? this.path,
    );
  }
}