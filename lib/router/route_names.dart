class Route {
  final String path;
  final String name;
  Route({required this.path, required this.name});
}

class AppRoute {
  static Route game = Route(path: '/game', name: 'game');
  static Route menu = Route(path: '/menu', name: 'menu');
}
