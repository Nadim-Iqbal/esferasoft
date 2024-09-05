import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  List<Widget> details = [];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadAllNotesList();
    loadHomeNotesList();
    loadWorkNotesList();
  }

  RxList<Map<String, String>> allNotesList = <Map<String, String>>[].obs;
  RxList<Map<String, String>> workNotesList = <Map<String, String>>[].obs;
  RxList<Map<String, String>> homeNotesList = <Map<String, String>>[].obs;

  Future<void> loadHomeNotesList() async {
    List<Map<String, String>> jsonList = await getHomeNotesList();
    homeNotesList.value = jsonList;
    homeNotesList.refresh();
  }

  Future<List<Map<String, String>>> getHomeNotesList() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('home_list_key');
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      print(jsonList);
      return jsonList.map((item) => Map<String, String>.from(item)).toList();
    } else {
      return [];
    }
  }

  Future<void> loadWorkNotesList() async {
    List<Map<String, String>> jsonList = await getWorkNotesList();
    workNotesList.value = jsonList;
    workNotesList.refresh();
  }

  Future<List<Map<String, String>>> getWorkNotesList() async {
    final prefs = await SharedPreferences.getInstance();

    String? jsonString = prefs.getString('work_list_key');
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      print(jsonList);
      return jsonList.map((item) => Map<String, String>.from(item)).toList();
    } else {
      return [];
    }
  }

  Future<void> loadAllNotesList() async {
    List<Map<String, String>> jsonList = await getAllNotesList();
    allNotesList.value = jsonList;
    allNotesList.refresh();
  }

  Future<List<Map<String, String>>> getAllNotesList() async {
    final prefs = await SharedPreferences.getInstance();

    String? jsonString = prefs.getString('all_list_key');
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      print(jsonList);
      return jsonList.map((item) => Map<String, String>.from(item)).toList();
    } else {
      return [];
    }
  }

  List<dynamic> productsList = [];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
