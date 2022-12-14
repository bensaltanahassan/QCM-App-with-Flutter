import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/view/screens/auth/forgetpassword.dart';
import 'package:qcmapp/view/screens/auth/login.dart';
import 'package:qcmapp/view/screens/auth/resetpassword.dart';
import 'package:qcmapp/view/screens/auth/signup.dart';
import 'package:qcmapp/view/screens/auth/verifyotp.dart';

List<GetPage<dynamic>>? routes = [
  //Language
  // GetPage(name: "/", page: () => const Language(), middlewares: [
  //   MyMiddleWare(),
  // ]),

  // onBoarding
  // GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),

  // Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.verifycode, page: () => const VerifyOtp()),
];
