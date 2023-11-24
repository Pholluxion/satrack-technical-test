// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $taskRoute,
      $taskCreateRoute,
      $taskDetailRoute,
    ];

RouteBase get $taskRoute => GoRouteData.$route(
      path: '/tasks',
      factory: $TaskRouteExtension._fromState,
    );

extension $TaskRouteExtension on TaskRoute {
  static TaskRoute _fromState(GoRouterState state) => const TaskRoute();

  String get location => GoRouteData.$location(
        '/tasks',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $taskCreateRoute => GoRouteData.$route(
      path: '/task/create',
      factory: $TaskCreateRouteExtension._fromState,
    );

extension $TaskCreateRouteExtension on TaskCreateRoute {
  static TaskCreateRoute _fromState(GoRouterState state) =>
      const TaskCreateRoute();

  String get location => GoRouteData.$location(
        '/task/create',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $taskDetailRoute => GoRouteData.$route(
      path: '/task/:id',
      factory: $TaskDetailRouteExtension._fromState,
    );

extension $TaskDetailRouteExtension on TaskDetailRoute {
  static TaskDetailRoute _fromState(GoRouterState state) => TaskDetailRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/task/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
