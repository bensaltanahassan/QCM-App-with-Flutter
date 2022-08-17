import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Attention",
      middleText: "Do you want to exit app ?",
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: const Text("Confirm"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel"),
        ),
      ]);
  return Future.value(true);
}
