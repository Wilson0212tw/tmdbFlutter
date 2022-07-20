import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gi_tg/network/model/index.dart';
import 'package:gi_tg/view/ePage.dart';
import 'package:gi_tg/view/home/home.dart';
import 'package:gi_tg/view/login.dart';
import 'package:gi_tg/view/movie/detail.dart';
import 'package:gi_tg/view/setting/setting.dart';

class PageConfig extends Equatable {
  PageConfig.home([Map<String, dynamic>? args])
      : this(location: '/home', args: args ?? {'initIdx': 0});
  const PageConfig.login() : this(location: '/login');
  const PageConfig.setting() : this(location: '/setting');
  PageConfig.detail(ArtWork mItem)
      : this(location: '/detail', args: {"mItem": mItem});

  final String location;
  final Map<String, dynamic> args;

  const PageConfig({
    required this.location,
    args,
  }) : args = args ?? const {};

  EPage get page => _routes[location]!(args);

  Uri get path => location.isNotEmpty ? Uri.parse(location) : Uri.parse('/');
  String get route => path.toString();

  @override
  List<Object?> get props => [location];
}

Map<String, EPage Function(Map<String, dynamic>)> _routes = {
  '/home': (args) => MyHomePage.getPage(args['title'] ?? ""),
  '/login': (args) => Login.getPage(),
  '/setting': (args) => Setting.getPage(),
  '/detail': (args) => Detail.getPage(args["mItem"] as ArtWork),
};
