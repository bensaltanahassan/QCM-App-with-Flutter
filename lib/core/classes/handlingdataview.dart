import 'package:flutter/material.dart';
import 'package:qcmapp/core/classes/statusrequest.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({Key? key, this.statusRequest, this.widget})
      : super(key: key);
  final StatusRequest? statusRequest;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return const Center(child: Text("Offline"));
    } else if (statusRequest == StatusRequest.serverfailure) {
      return const Center(child: Text("server "));
    } else if (statusRequest == StatusRequest.failure) {
      return const Center(child: Text("failer data "));
    } else {
      return widget!;
    }
  }
}
