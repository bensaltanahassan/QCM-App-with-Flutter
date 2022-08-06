import 'package:get/get.dart';
import 'package:qcmapp/controller/auth/logincontroller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    // Get.lazyPut(() => ForgetPasswordControllerImp(), fenix: true);
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
  }
}
