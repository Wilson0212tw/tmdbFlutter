import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gi_tg/constant.dart';
import 'package:gi_tg/localStorage/sharePreference.dart';
import 'package:gi_tg/network/model/index.dart';
import 'package:gi_tg/extension.dart';
import 'package:gi_tg/view/ePage.dart';
import 'package:gi_tg/view/setting/cubit/setting_cubit.dart';

class Setting extends StatelessWidget {
  static EPage getPage() => EPage((ctx) => const Setting());

  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Themes.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextButton(
                          style: e.themeData!.textButtonTheme.style,
                          onPressed: () async {
                            BlocProvider.of<SettingCubit>(context)
                                .changeTheme(e);
                          },
                          child: Text(
                            e.toString(),
                            style: const TextStyle(fontSize: 30),
                          )),
                    ),
                  )
                  .toList()
              //  [

              //   TextButton(onPressed: () async {}, child: Text('xxxxxx')),
              //   TextButton(onPressed: () async {}, child: Text('xxxxx1')),
              //   TextButton(onPressed: () async {}, child: Text('xxxxx2')),
              // ],
              )));
}
