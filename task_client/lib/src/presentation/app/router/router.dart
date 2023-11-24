import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:task_client/src/presentation/features/features.dart';

part 'router.g.dart';

GoRouter router = GoRouter(
  initialLocation: TaskPage.route,
  debugLogDiagnostics: true,
  routes: $appRoutes,
);

@TypedGoRoute<TaskRoute>(path: TaskPage.route)
class TaskRoute extends GoRouteData {
  const TaskRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TaskPage();
  }
}

@TypedGoRoute<TaskCreateRoute>(path: TaskCreatePage.route)
class TaskCreateRoute extends GoRouteData {
  const TaskCreateRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TaskCreatePage();
  }
}

@TypedGoRoute<TaskDetailRoute>(path: TaskDetailPage.route)
class TaskDetailRoute extends GoRouteData {
  const TaskDetailRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TaskDetailPage(id: id);
  }
}
