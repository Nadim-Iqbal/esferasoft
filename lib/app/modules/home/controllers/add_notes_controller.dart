import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNotesController extends GetxController {
  //TODO: Implement HomeController
  List<Widget> details = [];
  RxBool isChecked = false.obs;
  String? selectedValue;
  int selectedIndex = 3;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final count = 0.obs;
  String title = "";
  var list, type, index;
  RxBool isEdit = false.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      titleController.text = Get.arguments["title"];
      descriptionController.text = Get.arguments["desc"];
      type = Get.arguments["type"];
      if (type == 0) {
        selectedIndex = 0;
      } else if (type == 1) {
        selectedIndex = 1;
      } else {
        selectedIndex = 2;
      }
      print(":::::::::::::::::::::::::::$type");
      index = Get.arguments["index"];
    }
    loadAllNotesList();
    loadWorkNotesList();
    loadHomeNotesList();
    super.onInit();
    // _saveNotesData();
  }

  Future<void> removeAllNotesData() async {
    allNotesList.removeAt(index);

    await saveAllNotesList(allNotesList);
  }

  Future<void> removeWorkNotesData() async {
    workNotesList.removeAt(index);

    await saveWorkNotesList(workNotesList);
  }

  Future<void> removeHomeNotesData() async {
    homeNotesList.removeAt(index);

    await saveHomeNotesList(homeNotesList);
  }

  List<Map<String, String>> allNotesList = [];
  List<Map<String, String>> workNotesList = [];
  List<Map<String, String>> homeNotesList = [];

  Future<void> loadAllNotesList() async {
    List<Map<String, String>> jsonList = await getAllNotesList();
    allNotesList = jsonList;
    print("allNotesList::::::::::::::::::::$allNotesList");
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

  Future<void> loadWorkNotesList() async {
    List<Map<String, String>> jsonList = await getWorkNotesList();
    workNotesList = jsonList;
    print("workNotesList::::::::::::::::::::$workNotesList");
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

  Future<void> loadHomeNotesList() async {
    List<Map<String, String>> jsonList = await getHomeNotesList();
    homeNotesList = jsonList;
    print("homeNotesList::::::::::::::::::::$homeNotesList");
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

  List<Map<String, String>> jsonList = [];

  Future<void> saveHomeNotesData() async {
    var data = {
      "title": titleController.text.trim(),
      "description": descriptionController.text.trim()
    };
    if (type != null) {
      homeNotesList.removeAt(index);
    }
    homeNotesList.add(data);
    await saveHomeNotesList(homeNotesList);
    // loadAllNotesList(); // Refresh the list after saving
  }

  Future<void> saveHomeNotesList(List<Map<String, String>> jsonList) async {
    final prefs = await SharedPreferences.getInstance();
    // Convert the list of maps to JSON string
    String jsonString = jsonEncode(jsonList);
    debugPrint("jsonStringhome_list_key:::::: $jsonString");
    // Save the JSON string to SharedPreferences
    await prefs.setString('home_list_key', jsonString);
  }

  Future<void> saveWorkNotesData() async {
    var data = {
      "title": titleController.text.trim(),
      "description": descriptionController.text.trim()
    };
    if (type != null) {
      workNotesList.removeAt(index);
    }
    workNotesList.add(data);
    await saveWorkNotesList(workNotesList);
  }

  Future<void> saveWorkNotesList(List<Map<String, String>> jsonList) async {
    final prefs = await SharedPreferences.getInstance();
    // Convert the list of maps to JSON string
    String jsonString = jsonEncode(jsonList);
    debugPrint("jsonStringwork_list_key:::::: $jsonString");
    // Save the JSON string to SharedPreferences
    await prefs.setString('work_list_key', jsonString);
  }

  Future<void> saveAllNotesData() async {
    var data = {
      "title": titleController.text.trim(),
      "description": descriptionController.text.trim()
    };
    if (type != null) {
      allNotesList.removeAt(index);
    }
    allNotesList.add(data);
    await saveAllNotesList(allNotesList);
    // loadAllNotesList(); // Refresh the list after saving
  }

  Future<void> saveAllNotesList(List<Map<String, String>> jsonList) async {
    final prefs = await SharedPreferences.getInstance();
    // Convert the list of maps to JSON string
    String jsonString = jsonEncode(jsonList);
    debugPrint("jsonString:::::: $jsonString");
    // Save the JSON string to SharedPreferences
    await prefs.setString('all_list_key', jsonString);
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
