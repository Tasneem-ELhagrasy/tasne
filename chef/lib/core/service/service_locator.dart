import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/features/auth/presentation/cubit/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit());
}
