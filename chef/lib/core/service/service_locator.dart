import 'package:chef/core/bloc/cubit/global_cubit.dart';
import 'package:chef/core/database/api/api_consumer.dart';
import 'package:chef/core/database/api/dio_consumer.dart';
import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/features/auth/presentation/cubit/cubit/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef/features/auth/presentation/cubit/cubit/login_cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repodatry/auth_repodatry.dart';

final sl = GetIt.instance;
void initServiceLoactor() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => AuthRepodatry());
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => ForgetPasswordCubit(sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}
