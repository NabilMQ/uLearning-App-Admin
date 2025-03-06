class RouteEvents {}

class ChangeEvent extends RouteEvents {
  ChangeEvent({required this.path});

  final String path;
}
