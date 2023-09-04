import 'package:chef/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'core/bloc/cubit/global_cubit.dart';
import 'core/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLoactor();
  await sl<CacheHelper>().init();

  runApp(BlocProvider(
    create: (context) => sl<GlobalCubit>()..getCachedLang(),
    child: const MyApp(),
  ));
}
