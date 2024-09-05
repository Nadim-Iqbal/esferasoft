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
    print("homeNotesList:::::::::::::::$homeNotesList");
  }

  Future<List<Map<String, String>>> getHomeNotesList() async {
    final prefs = await SharedPreferences.getInstance();
    // Retrieve the JSON string from SharedPreferences
    String? jsonString = prefs.getString('home_list_key');
    if (jsonString != null) {
      // Decode the JSON string to a list of maps
      List<dynamic> jsonList = jsonDecode(jsonString);
      print(jsonList);
      return jsonList.map((item) => Map<String, String>.from(item)).toList();
    } else {
      // Return an empty list if no data is found
      return [];
    }
  }

  Future<void> loadWorkNotesList() async {
    List<Map<String, String>> jsonList = await getWorkNotesList();
    workNotesList.value = jsonList;
    workNotesList.refresh();
    print("workNotesList:::::::::::::::$workNotesList");
  }

  Future<List<Map<String, String>>> getWorkNotesList() async {
    final prefs = await SharedPreferences.getInstance();
    // Retrieve the JSON string from SharedPreferences
    String? jsonString = prefs.getString('work_list_key');
    if (jsonString != null) {
      // Decode the JSON string to a list of maps
      List<dynamic> jsonList = jsonDecode(jsonString);
      print(jsonList);
      return jsonList.map((item) => Map<String, String>.from(item)).toList();
    } else {
      // Return an empty list if no data is found
      return [];
    }
  }

  Future<void> loadAllNotesList() async {
    List<Map<String, String>> jsonList = await getAllNotesList();
    allNotesList.value = jsonList;
    allNotesList.refresh();
    print(":::::::::::::::$allNotesList");
  }

  Future<List<Map<String, String>>> getAllNotesList() async {
    final prefs = await SharedPreferences.getInstance();
    // Retrieve the JSON string from SharedPreferences
    String? jsonString = prefs.getString('all_list_key');
    if (jsonString != null) {
      // Decode the JSON string to a list of maps
      List<dynamic> jsonList = jsonDecode(jsonString);
      print(jsonList);
      return jsonList.map((item) => Map<String, String>.from(item)).toList();
    } else {
      // Return an empty list if no data is found
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

  void increment() => count.value++;
}
