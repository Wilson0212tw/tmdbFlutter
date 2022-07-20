import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gi_tg/constant.dart';
import 'package:gi_tg/localStorage/sharePreference.dart';
import 'package:gi_tg/network/model/index.dart';
import 'package:gi_tg/extension.dart';
import 'package:gi_tg/router/navigationCubit.dart';
import 'package:gi_tg/view/ePage.dart';
import 'package:gi_tg/view/setting/cubit/setting_cubit.dart';

class Login extends StatefulWidget {
  static EPage getPage() => EPage((ctx) => const Login());

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    getLogin();
  }

  void getLogin() async {
    final result = await SharePreference.isLogin();
    setState(() {
      isLogin = result;
    });
  }

  void setLogin() async {
    await SharePreference.setLogin(!isLogin);
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<SettingCubit, SettingState>(
      builder: (ctx, state) => Scaffold(
          appBar: AppBar(),
          body: Center(
              child: TextButton(
                  onPressed: () async {
                    BlocProvider.of<SettingCubit>(context).setLogin();
                    BlocProvider.of<NavigationCubit>(context).pop();
                  },
                  child: Text(state.isLogin ? "登出" : "登入")))));
}
