class Route {
  final String path;
  final String name;
  Route({required this.path, required this.name});
}

class AppRoute {
  static Route main = Route(path: '/main', name: 'main');
  static Route game = Route(path: '/game', name: 'game');
  static Route menu = Route(path: '/menu', name: 'menu');
  static Route trophy = Route(path: '/trophy', name: 'trophy');
  static Route profile = Route(path: '/profile', name: 'profile');
}
