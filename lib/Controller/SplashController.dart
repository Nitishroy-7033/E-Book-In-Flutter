import 'package:e_book/Pages/Homepage/HomePage.dart';
import 'package:e_book/Pages/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashcontroller extends GetxController{
  @override
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    splaceController();
  }

  void splaceController() {
    Future.delayed(Duration(seconds: 4), () {
      if (auth.currentUser != null) {
        Get.offAll(Homepage());
      } else {
        Get.offAll(Welcomepage());
      }
    });
  }
}
