part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final Themes theme;
  final bool isLogin;

  const SettingState({this.theme = Themes.white, this.isLogin = false});

  @override
  List<Object> get props => [theme, isLogin];

  SettingState copyWith({Themes? theme_, bool? isLogin_}) =>
      SettingState(theme: theme_ ?? theme, isLogin: isLogin_ ?? isLogin);
}

enum Themes {
  black,
  white,
  whocare;

  ThemeData? get themeData => themeDataMap[toString()];

  const Themes();

  @override
  String toString() => "$name";
}

Map<String, ThemeData> themeDataMap = {
  "black": ThemeData(
      primarySwatch: Colors.deepPurple,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.purpleAccent,
      ))),
  "white": ThemeData(
      primarySwatch: Colors.blue,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.blueGrey,
      ))),
  "whocare": ThemeData(
      primarySwatch: Colors.yellow,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.red,
      )))
};
