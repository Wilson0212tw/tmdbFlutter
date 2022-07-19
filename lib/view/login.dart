import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gi_tg/constant.dart';
import 'package:gi_tg/localStorage/sharePreference.dart';
import 'package:gi_tg/network/model/index.dart';
import 'package:gi_tg/extension.dart';

class Login extends StatefulWidget {
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
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      body: Center(
          child: TextButton(
              onPressed: () async {
                print("ori--$isLogin");
                setLogin();
                Navigator.of(context).pop(!isLogin);
                print(isLogin);
              },
              child: Text(isLogin ? "登出" : "登入"))));
}
