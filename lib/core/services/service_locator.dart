import 'package:get_it/get_it.dart';
import 'package:to_do_app2/core/database/cache_helper.dart';
import 'package:to_do_app2/core/database/sqflite_helper.dart';

final getIt = GetIt.instance;

void setup() {
  // this object will created when call CacheHelper object only not in starting of the app like registerSingleton
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<SqfLiteHelper>(() => SqfLiteHelper());
}
