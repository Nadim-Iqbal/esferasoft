import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:esferasoft/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/app_colors.dart';
import '../../../model/model_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(HomeController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Product> productsList = [];
  List brandlist = [];
  var responseData;
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        key: _scaffoldKey,
        floatingActionButton: Stack(
          children: [
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton.small(
                onPressed: () {
                  // Action for first FAB
                },
                child: Icon(
                  Icons.person,
                  color: Colors.grey.shade800,
                ),
                backgroundColor: Colors.black,
              ),
            ),
            Positioned(
              right: 140,
              bottom: 20,
              child: FloatingActionButton.small(
                onPressed: () {
                  Get.toNamed(AppPages.ADDNOTES);
                  // Action for second FAB
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.grey.shade800,
              ),
            ),
            Positioned(
              left: 50,
              bottom: 20,
              child: FloatingActionButton.small(
                onPressed: () {
                  // Action for third FAB
                },
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                backgroundColor: Colors.grey.shade800,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: AppColors.background,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 20, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Good Morning,\nDimitar!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    "assets/images.png",
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(45)),
                          ),
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 25, left: 4, right: 4),
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black,
                    ),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ContainedTabBarView(
                      tabBarProperties: const TabBarProperties(
                        unselectedLabelColor: Colors.yellow,
                        labelColor: Colors.yellow,
                      ),
                      tabs: const [
                        Text(
                          'All Notes',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        Text(
                          'Work',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                      views: [
                        Padding(
                          padding: const EdgeInsets.only(right: 0, left: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    width: MediaQuery.of(context).size.width,
                                    child:
                                        // GetBuilder<HomeController>(builder: (homeController) {
                                        //   // List product = Get.find<HomeController>().details;
                                        //     return
                                        Obx(() => controller
                                                .allNotesList.value.isNotEmpty
                                            ? GridView.builder(
                                                padding:
                                                    EdgeInsets.only(top: 19),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 10.0,
                                                ),
                                                itemCount: controller
                                                    .allNotesList
                                                    .length, // Number of items in the grid
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppPages.ADDNOTES,
                                                          arguments: {
                                                            "title": controller
                                                                    .allNotesList
                                                                    .value[
                                                                index]["title"],
                                                            "desc": controller
                                                                        .allNotesList[
                                                                    index]
                                                                ["description"],
                                                            "list": controller
                                                                .allNotesList
                                                                .value,
                                                            "index": index,
                                                            "type": 0,
                                                          });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .yellowAccent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment
                                                        //         .spaceAround,
                                                        children: [
                                                          Text(
                                                            controller
                                                                    .allNotesList[
                                                                index]["title"]!,
                                                            maxLines: 4,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              controller.allNotesList[
                                                                      index][
                                                                  "description"]!,
                                                              maxLines: 4,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                                    image:
                                                                        const DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image:
                                                                          AssetImage(
                                                                        "assets/images.png",
                                                                      ),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            45)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : Center(
                                                child: Text(
                                                  "No notes found",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ))
                                    //   }
                                    // )
                                    ),

                                //Code
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0, left: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    width: MediaQuery.of(context).size.width,
                                    child:
                                        // GetBuilder<HomeController>(builder: (homeController) {
                                        //   // List product = Get.find<HomeController>().details;
                                        //     return
                                        Obx(() => controller
                                                .workNotesList.value.isNotEmpty
                                            ? GridView.builder(
                                                padding:
                                                    EdgeInsets.only(top: 19),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 10.0,
                                                ),
                                                itemCount: controller
                                                    .workNotesList
                                                    .length, // Number of items in the grid
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppPages.ADDNOTES,
                                                          arguments: {
                                                            "title": controller
                                                                    .workNotesList
                                                                    .value[
                                                                index]["title"],
                                                            "desc": controller
                                                                        .workNotesList[
                                                                    index]
                                                                ["description"],
                                                            "list": controller
                                                                .workNotesList
                                                                .value,
                                                            "index": index,
                                                            "type": 1,
                                                          });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .yellowAccent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment
                                                        //         .spaceAround,
                                                        children: [
                                                          Text(
                                                            controller
                                                                    .workNotesList[
                                                                index]["title"]!,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              controller.workNotesList[
                                                                      index][
                                                                  "description"]!,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 4,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                                    image:
                                                                        const DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image:
                                                                          AssetImage(
                                                                        "assets/images.png",
                                                                      ),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            45)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : Center(
                                                child: Text(
                                                  "No notes found",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ))
                                    //   }
                                    // )
                                    ),

                                //Code
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0, left: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    width: MediaQuery.of(context).size.width,
                                    child:
                                        // GetBuilder<HomeController>(builder: (homeController) {
                                        //   // List product = Get.find<HomeController>().details;
                                        //     return
                                        Obx(() => controller
                                                .homeNotesList.isNotEmpty
                                            ? GridView.builder(
                                                padding:
                                                    EdgeInsets.only(top: 19),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10.0,
                                                  mainAxisSpacing: 10.0,
                                                ),
                                                itemCount: controller
                                                    .homeNotesList
                                                    .length, // Number of items in the grid
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          AppPages.ADDNOTES,
                                                          arguments: {
                                                            "title": controller
                                                                    .homeNotesList
                                                                    .value[
                                                                index]["title"],
                                                            "desc": controller
                                                                        .homeNotesList[
                                                                    index]
                                                                ["description"],
                                                            "list": controller
                                                                .homeNotesList
                                                                .value,
                                                            "index": index,
                                                            "type": 2,
                                                          });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .yellowAccent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment
                                                        //         .spaceAround,
                                                        children: [
                                                          Text(
                                                            controller
                                                                    .homeNotesList[
                                                                index]["title"]!,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              controller.homeNotesList[
                                                                      index][
                                                                  "description"]!,
                                                              maxLines: 4,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                                    image:
                                                                        const DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image:
                                                                          AssetImage(
                                                                        "assets/images.png",
                                                                      ),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            45)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : Center(
                                                child: Text(
                                                  "No notes found",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ))
                                    //   }
                                    // )
                                    ),

                                //Code
                              ],
                            ),
                          ),
                        ),
                      ],
                      onChange: (index) => print(index),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  User({
    this.id,
    this.userId,
    this.title,
    this.body,
  });
}
