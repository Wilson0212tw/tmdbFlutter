import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gi_tg/localStorage/sharePreference.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(bool isLogin) : super(SettingState(isLogin: isLogin));

  changeTheme(Themes theme) => emit(SettingState(theme: theme));

  setLogin() async {
    await SharePreference.setLogin(!state.isLogin);
    emit(state.copyWith(isLogin_: !state.isLogin));
  }
}
