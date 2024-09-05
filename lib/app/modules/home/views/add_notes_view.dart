import 'package:esferasoft/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_notes_controller.dart';

class AddNotesScreen extends GetView<AddNotesController> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: [
              controller.type != null
                  ? GestureDetector(
                      onTap: () {
                        if (controller.selectedIndex == 0) {
                          controller.removeAllNotesData();
                        } else if (controller.selectedIndex == 1) {
                          controller.removeWorkNotesData();
                        } else {
                          controller.removeHomeNotesData();
                        }
                        Get.find<HomeController>().onInit();
                        Get.back();
                      },
                      child: Icon(Icons.delete).marginOnly(right: 10))
                  : SizedBox(),
              controller.type != null
                  ? GestureDetector(
                      onTap: () {
                        controller.isEdit.value = !(controller.isEdit.value);
                      },
                      child: Icon(controller.isEdit.value
                              ? Icons.close
                              : Icons.edit)
                          .marginOnly(right: 10))
                  : SizedBox(),
            ],
            title: Text(
              controller.type != null
                  ? controller.isEdit.value
                      ? "Edit Notes"
                      : 'Notes'
                  : "Create Notes",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: !controller.isEdit.value && controller.type != null
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // Profile Picture
                            Center(
                              child: CircleAvatar(
                                radius: 80.0,
                                backgroundImage:
                                    AssetImage('assets/images.png'),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            // User Name
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Title',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                ),
                                Text(
                                  ':',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                ),
                                Text(
                                  controller.titleController.text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Description',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                ),
                                Text(
                                  '  :',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                ),
                                Expanded(
                                  child: Text(
                                    controller.descriptionController.text,
                                    maxLines: 2,
                                    textAlign: TextAlign.right,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Category',
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                ),
                                Text(
                                  ':',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                ),
                                Text(
                                  controller.type == 0
                                      ? "All Notes"
                                      : controller.type == 1
                                          ? "Work"
                                          : "Home",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          TextFormField(
                            controller: controller.titleController,
                            maxLength: 10,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter title',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Title cannot be empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          Text('Description:',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          TextFormField(
                            controller: controller.descriptionController,
                            minLines: 4,
                            maxLines: 4,
                            maxLength: 40,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter Description',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Description cannot be empty';
                              } else if (value.toString().length < 20) {
                                return 'Minimum character should be 20';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          Text('Categories',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          controller.type != null && controller.isEdit.value
                              ? Container(
                                  width: Get.width,
                                  height: 60,
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black)),
                                  child: Text(
                                      controller.selectedIndex == 0
                                          ? "All Notes"
                                          : controller.selectedIndex == 1
                                              ? "Work"
                                              : controller.selectedIndex == 2
                                                  ? "Home"
                                                  : "Choose categories",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                )
                              : DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  hint: Text(
                                    controller.selectedIndex == 0
                                        ? "All Notes"
                                        : controller.selectedIndex == 1
                                            ? "Work"
                                            : controller.selectedIndex == 2
                                                ? "Home"
                                                : "Choose categories",
                                  ),
                                  value: _selectedValue,
                                  items: <String>['All Notes', 'Work', 'Home']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    // setState(() {
                                    _selectedValue = newValue;
                                    if (_selectedValue == "All Notes") {
                                      controller.selectedIndex = 0;
                                      print(
                                          controller.selectedIndex.toString());
                                    } else if (_selectedValue == "Work") {
                                      controller.selectedIndex = 1;
                                      print(
                                          controller.selectedIndex.toString());
                                    } else {
                                      controller.selectedIndex = 2;
                                      print(
                                          controller.selectedIndex.toString());
                                    }
                                  },
                                  validator: (value) {
                                    if (controller.selectedIndex == 3) {
                                      return 'Please select an option';
                                    }
                                    return null;
                                  },
                                ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                    height: 50,
                                    width: 130,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text('Discard',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14))),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    print(
                                        ":::::::::::::::${controller.selectedIndex}");
                                    if (controller.selectedIndex == 0) {
                                      controller.saveAllNotesData();
                                    } else if (controller.selectedIndex == 1) {
                                      controller.saveWorkNotesData();
                                    } else {
                                      controller.saveHomeNotesData();
                                    }
                                    Get.find<HomeController>().onInit();
                                    Get.back();
                                  }
                                },
                                child: Container(
                                    width: 130,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.yellowAccent.shade400,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                        controller.isEdit.value
                                            ? "Update"
                                            : 'Save',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14))),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ));
  }
}
