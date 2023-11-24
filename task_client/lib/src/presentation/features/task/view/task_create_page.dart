import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:task_client/src/core/core.dart';
import 'package:task_client/src/domain/domain.dart';

import '../cubit/cubit.dart';

class TaskCreatePage extends StatelessWidget {
  const TaskCreatePage({Key? key}) : super(key: key);

  static const route = '/task/create';

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
      child: const TaskCreateView(),
    );
  }
}

class TaskCreateView extends StatefulWidget {
  const TaskCreateView({
    super.key,
  });

  @override
  State<TaskCreateView> createState() => _TaskCreateViewState();
}

class _TaskCreateViewState extends State<TaskCreateView> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late ValueNotifier<String> _priorityNotifier;
  late ValueNotifier<List<int>> _categoryNotifier;
  late ValueNotifier<List<int>> _dateNotifier;

  final prioriyList = [
    'LOW',
    'MEDIUM',
    'HIGH',
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _categoryNotifier = ValueNotifier([]);
    _dateNotifier = ValueNotifier([]);
    _priorityNotifier = ValueNotifier(prioriyList.first);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryNotifier.dispose();
    _dateNotifier.dispose();
    _priorityNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear nueva tarea'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: BlocConsumer<TaskCubit, TaskState>(
              listener: (context, state) {
                if (state is TaskCreated) {
                  context.pop();
                }
              },
              builder: (context, state) {
                if (state is TaskLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TaskError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                return Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(100),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(200),
                        ],
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Descripción',
                        ),
                      ),
                      BlocBuilder<CategoryCubit, CategoryState>(
                        builder: (context, state) {
                          return DropdownButtonFormField(
                            decoration: const InputDecoration(
                              labelText: 'Categoría',
                            ),
                            items: [
                              if (state is CategoryLoaded)
                                for (final category in state.categories)
                                  DropdownMenuItem(
                                    value: category.id,
                                    child: Text(category.name),
                                  ),
                            ],
                            onChanged: (value) {
                              _categoryNotifier.value = [
                                ..._categoryNotifier.value,
                                value as int,
                              ];
                            },
                          );
                        },
                      ),
                      ValueListenableBuilder<String>(
                        valueListenable: _priorityNotifier,
                        builder: (context, value, child) {
                          return DropdownButtonFormField(
                            decoration: const InputDecoration(
                              labelText: 'Prioridad',
                            ),
                            value: value,
                            items: [
                              for (final priority in prioriyList)
                                DropdownMenuItem(
                                  value: priority,
                                  child: Text(priority),
                                ),
                            ],
                            onChanged: (value) {
                              _priorityNotifier.value = value as String;
                            },
                          );
                        },
                      ),
                      ValueListenableBuilder<List<int>>(
                        valueListenable: _dateNotifier,
                        builder: (context, value, child) {
                          return Text(
                            value.isEmpty
                                ? ''
                                : '${value[0]}-${value[1]}-${value[2]}',
                            style: Theme.of(context).textTheme.titleMedium,
                          );
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                                helpText: 'Seleccione una fecha',
                                locale: const Locale('es', 'ES'),
                              ) ??
                              DateTime.now();
                          _dateNotifier.value = [
                            date.year,
                            date.month,
                            date.day,
                          ];
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Seleccione una fecha'),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final task = TaskEntity(
                            id: 0,
                            title: _titleController.text,
                            description: _descriptionController.text,
                            categories: _categoryNotifier.value,
                            endDate: _dateNotifier.value,
                            isTaskCompleted: false,
                            priority: _priorityNotifier.value,
                          );

                          context.read<TaskCubit>().addTask(task);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Crear'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
