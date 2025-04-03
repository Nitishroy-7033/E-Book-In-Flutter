import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PdfController extends GetxController{
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  // @override
  // void onInit() {
    // TODO: implement onInit
  //   super.onInit();
  // }
}