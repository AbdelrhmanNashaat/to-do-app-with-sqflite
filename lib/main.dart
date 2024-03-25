import 'package:flutter/material.dart';
import 'package:to_do_app2/core/database/cache_helper.dart';

import 'core/database/sqflite_helper.dart';
import 'core/services/service_locator.dart';
import 'to_do_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CacheHelper>().init();
  getIt<SqfLiteHelper>().initDb();
  runApp(const NotesApp());
}