import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:energise_test/controllers/ip_info/ip_info_service.dart';
import 'package:energise_test/models/ip_info.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'ip_info_state.dart';

class IpInfoCubit extends Cubit<IpInfoState> {
  final IpInfoService _apiService;
  final SharedPreferences _prefs;

  IpInfoCubit(this._apiService, this._prefs) : super(const IpInfoInitial());

  Future<void> getIpInfo() async {
    try {
      emit(const IpInfoLoading());
      final ipInfo = await _apiService.fetchIpInfo();
      // Save data to cache
      _prefs.setString('ipInfo', jsonEncode(ipInfo.toJson()));
      emit(IpInfoLoaded(ipInfo));
    } catch (e) {
      // If error, load data from cache
      final ipInfo = IpInfo.fromJson(jsonDecode(_prefs.getString('ipInfo')!));
      emit(IpInfoLoaded(ipInfo));
    }
  }
}
