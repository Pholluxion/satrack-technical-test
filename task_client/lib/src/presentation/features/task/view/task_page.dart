import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/presentation/app/router/router.dart';

import '../cubit/cubit.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  static const route = '/tasks';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<TaskCubit>()..loadTasks(),
        ),
        BlocProvider(
          create: (context) => getIt.get<CategoryCubit>()..loadCategories(),
        ),
      ],
      child: const TaskView(),
    );
  }
}

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late ValueNotifier<int> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(0);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Tus tareas'),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoaded) {
                      return ValueListenableBuilder(
                        valueListenable: _valueNotifier,
                        builder: (context, value, child) {
                          return DropdownButtonHideUnderline(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                underline: const SizedBox(),
                                value: value,
                                items: [
                                  const DropdownMenuItem(
                                    value: 0,
                                    child: Text('Todas'),
                                  ),
                                  for (final category in state.categories)
                                    DropdownMenuItem(
                                      value: category.id,
                                      child: Text(category.name),
                                    ),
                                ],
                                onChanged: (value) {
                                  _valueNotifier.value = value as int;
                                  context
                                      .read<TaskCubit>()
                                      .loadTasksByCategory(value);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TaskLoaded) {
                  return ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return ListTile(
                        onTap: () => TaskDetailRoute(id: task.id).push(context),
                        title: Text(task.title),
                        subtitle: Text(task.description),
                        leading: Checkbox(
                          value: task.isTaskCompleted,
                          onChanged: (value) {
                            context.read<TaskCubit>().updateTask(
                                  task.copyWith(isTaskCompleted: value),
                                );
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            context.read<TaskCubit>().deleteTask(task.id);
                          },
                        ),
                      );
                    },
                  );
                } else if (state is TaskError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Center(
                    child: Text('Caragando tareas...'),
                  );
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const TaskCreateRoute().push(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
