import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gi_tg/localStorage/sharePreference.dart';
import 'package:gi_tg/network/service.dart';
import 'package:gi_tg/router/ERouterDelegate.dart';
import 'package:gi_tg/router/navigationCubit.dart';
import 'package:gi_tg/router/pageConfig.dart';
import 'package:gi_tg/view/home/home.dart';
import 'package:gi_tg/view/movie/popular.dart';
import 'package:gi_tg/view/setting/cubit/setting_cubit.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

final logger = Logger();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isLogin = await SharePreference.isLogin();
  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatefulWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(
              create: (ctx) => NavigationCubit([PageConfig.home()])),
          BlocProvider<SettingCubit>(
              create: (ctx) => SettingCubit(widget.isLogin))
        ],
        child: BlocBuilder<SettingCubit, SettingState>(
            builder: (ctx, state) => MaterialApp.router(
                  theme: state.theme.themeData,
                  routerDelegate: ERouterDelegate(),
                )),
      );
}
