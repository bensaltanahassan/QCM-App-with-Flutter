import 'package:get/get.dart';
import 'package:qcmapp/core/classes/crud.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
