import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gi_tg/view/epage.dart';
import 'package:gi_tg/view/home/home.dart';
import 'package:gi_tg/view/login.dart';

class PageConfig {
  PageConfig.home([Map<String, dynamic>? args])
      : this(location: '/home', args: args ?? {'initIdx': 0});
  PageConfig.login() : this(location: '/login');
  PageConfig.setting() : this(location: '/setting');

  final String location;
  final Map<String, dynamic> args;

  PageConfig({
    required this.location,
    args,
  }) : args = args ?? const {};

  Map<String, EPage Function(Map<String, dynamic>)> _routes = {
    '/home': (args) => MyHomePage.getPage(args['title'] ?? ""),
    '/login': (args) => Login.getPage(),
  };

  EPage get page => _routes[location]!(args);

  Uri get path => location.isNotEmpty ? Uri.parse(location) : Uri.parse('/');
  String get route => path.toString();
}
