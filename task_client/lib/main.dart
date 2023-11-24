import 'package:flutter/material.dart';

import 'bootstrap.dart';
import 'src/core/injection/service_locator.dart' as sl;
import 'src/presentation/presentation.dart' show TaskApp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.setup();
  bootstrap(() async => const TaskApp());
}
