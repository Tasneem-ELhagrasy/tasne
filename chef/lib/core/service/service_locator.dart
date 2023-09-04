import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => GlobalCubit());
}
