import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gi_tg/constant.dart';
import 'package:gi_tg/localStorage/sharePreference.dart';
import 'package:gi_tg/network/model/index.dart';
import 'package:gi_tg/extension.dart';
import 'package:gi_tg/view/epage.dart';

class Setting extends StatelessWidget {
  static EPage getPage() => EPage((ctx) => const Setting());

  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          TextButton(onPressed: () async {}, child: Text('xxxxxx')),
          TextButton(onPressed: () async {}, child: Text('xxxxx1')),
          TextButton(onPressed: () async {}, child: Text('xxxxx2')),
        ],
      )));
}
