import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:chef/features/auth/presentation/cubit/cubit/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef/features/auth/presentation/cubit/cubit/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'core/bloc/cubit/global_cubit.dart';
import 'core/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLoactor();
  await sl<CacheHelper>().init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<GlobalCubit>()..getCachedLang(),
      ),
      BlocProvider(
        create: (context) => sl<LoginCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<ForgetPasswordCubit>(),
      ),
    ],
    child: const MyApp(),
  ));
}
