import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gi_tg/localStorage/sharePreference.dart';
import 'package:gi_tg/network/service.dart';
import 'package:gi_tg/router/ERouterDelegate.dart';
import 'package:gi_tg/router/navigationCubit.dart';
import 'package:gi_tg/router/pageConfig.dart';
import 'package:gi_tg/view/home/home.dart';
import 'package:gi_tg/view/movie/popular.dart';
import 'package:logging/logging.dart';

void main() async {
  _setupLogging();
  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.FINE;
  Logger.root.onRecord.listen((rec) {
    log('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<NavigationCubit>(
        create: (ctx) => NavigationCubit([PageConfig.home()]),
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerDelegate: ERouterDelegate(),
        ),
      );
}
