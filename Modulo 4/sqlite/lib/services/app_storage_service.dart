import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_KEYS {
  REGISTEREDDATANAMEKEY,
  REGISTEREDDATABORNKEY,
  REGISTEREDDATALVLKEY,
  REGISTEREDDATALANGKEY,
  REGISTEREDDATATIMEKEY,
  REGISTEREDDATASALARYKEY,
  USERNAMEKEY,
  USERHEIGHTKEY,
  PUSHNOTIFICATIONKEY,
  DARKTHEMEKEY,
  CHAVENUMGER,
  CHAVECLICKS
}

class AppStorageService {
  _setString(String key, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? "";
  }

  _setStringList(String key, List<String> value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(key, value);
  }

  Future<List<String>> _getStringList(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  _setInt(String key, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(key) ?? 0;
  }

  _setDouble(String key, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(key) ?? 0;
  }

  _setBool(String key, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(key, value);
  }

  Future<bool> _getBool(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(key) ?? false;
  }

  Future<void> setConfigUserName(String name) async {
    await _setString(STORAGE_KEYS.USERNAMEKEY.toString(), name);
  }

  Future<String> getConfigUserName() async {
    return _getString(STORAGE_KEYS.USERNAMEKEY.toString());
  }

  Future<void> setConfigUserHeight(double value) async {
    await _setDouble(STORAGE_KEYS.USERNAMEKEY.toString(), value);
  }

  Future<double> getConfigUserHeight() async {
    return _getDouble(STORAGE_KEYS.USERNAMEKEY.toString());
  }

  Future<void> setConfigUserPush(bool value) async {
    await _setBool(STORAGE_KEYS.PUSHNOTIFICATIONKEY.toString(), value);
  }

  Future<bool> getConfigUserPush() async {
    return _getBool(STORAGE_KEYS.PUSHNOTIFICATIONKEY.toString());
  }

  Future<void> setConfigUserDark(bool value) async {
    await _setBool(STORAGE_KEYS.DARKTHEMEKEY.toString(), value);
  }

  Future<bool> getConfigUserDark() async {
    return _getBool(STORAGE_KEYS.DARKTHEMEKEY.toString());
  }

  Future<void> setRegisteredDataName(String name) async {
    await _setString(STORAGE_KEYS.REGISTEREDDATANAMEKEY.toString(), name);
  }

  Future<String> getRegisteredDataName() async {
    return _getString(STORAGE_KEYS.REGISTEREDDATANAMEKEY.toString());
  }

  Future<void> setRegisteredDataBorn(DateTime date) async {
    await _setString(
        STORAGE_KEYS.REGISTEREDDATABORNKEY.toString(), date.toString());
  }

  Future<String> getRegisteredDataBorn() async {
    return _getString(STORAGE_KEYS.REGISTEREDDATABORNKEY.toString());
  }

  Future<void> setRegisteredDataLvl(String lvl) async {
    await _setString(STORAGE_KEYS.REGISTEREDDATALVLKEY.toString(), lvl);
  }

  Future<String> getRegisteredDataLvl() async {
    return _getString(STORAGE_KEYS.REGISTEREDDATALVLKEY.toString());
  }

  Future<void> setRegisteredDataLang(List<String> lang) async {
    await _setStringList(STORAGE_KEYS.REGISTEREDDATALANGKEY.toString(), lang);
  }

  Future<List<String>> getRegisteredDataLang() async {
    return _getStringList(STORAGE_KEYS.REGISTEREDDATALANGKEY.toString());
  }

  Future<void> setRegisteredDataTime(int time) async {
    await _setInt(STORAGE_KEYS.REGISTEREDDATATIMEKEY.toString(), time);
  }

  Future<int> getRegisteredDataTime() async {
    return _getInt(STORAGE_KEYS.REGISTEREDDATATIMEKEY.toString());
  }

  Future<void> setRegisteredDataSalary(double salary) async {
    await _setDouble(STORAGE_KEYS.REGISTEREDDATASALARYKEY.toString(), salary);
  }

  Future<double> getRegistereDataSalary() async {
    return _getDouble(STORAGE_KEYS.REGISTEREDDATASALARYKEY.toString());
  }

  Future<void> setRandomNum(int value) async {
    await _setInt(STORAGE_KEYS.CHAVENUMGER.toString(), value);
  }

  Future<int> getRandomNum() async {
    return _getInt(STORAGE_KEYS.CHAVENUMGER.toString());
  }

  Future<void> setRandomClicks(int value) async {
    await _setInt(STORAGE_KEYS.CHAVECLICKS.toString(), value);
  }

  Future<int> getRandomClicks() async {
    return _getInt(STORAGE_KEYS.CHAVECLICKS.toString());
  }
}
