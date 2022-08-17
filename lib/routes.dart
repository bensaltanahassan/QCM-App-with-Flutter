import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:qcmapp/core/constant/routes.dart';
import 'package:qcmapp/core/middleware/mymiddleware.dart';
import 'package:qcmapp/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:qcmapp/view/screens/auth/forgetpassword/successresetpasswor.dart';
import 'package:qcmapp/view/screens/auth/login.dart';
import 'package:qcmapp/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:qcmapp/view/screens/auth/signup.dart';
import 'package:qcmapp/view/screens/auth/forgetpassword/verifyotpforgetpassword.dart';
import 'package:qcmapp/view/screens/auth/successsignup.dart';
import 'package:qcmapp/view/screens/auth/verifycodesignup.dart';
import 'package:qcmapp/view/screens/guest/informationguset.dart';
import 'package:qcmapp/view/screens/home/choosecategorie.dart';
import 'package:qcmapp/view/screens/home/chooseschool.dart';
import 'package:qcmapp/view/screens/home/home.dart';
import 'package:qcmapp/view/screens/onboarding/onboarding.dart';
import 'package:qcmapp/view/screens/questions/questionscreen.dart';
import 'package:qcmapp/view/screens/score/score.dart';
import 'package:qcmapp/view/screens/welcome/welcome.dart';

List<GetPage<dynamic>>? routes = [
  //Language
  GetPage(name: "/", page: () => const OnBoarding(), middlewares: [
    OnBoardingMiddleWare(),
    LoginMiddleWare(),
  ]),

  // onBoarding
  // GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),

  // Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoutes.verifycodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.succesResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoutes.verifycoderesetpassword,
      page: () => const VerifyOtpForgetPassword()),
  GetPage(
    name: AppRoutes.welcome,
    page: () => const Welcome(),
  ),
  GetPage(name: AppRoutes.home, page: () => const Home()),
  GetPage(name: AppRoutes.chooseschool, page: () => const ChooseSchool()),
  GetPage(name: AppRoutes.choosecategorie, page: () => const ChooseCategorie()),
  GetPage(name: AppRoutes.question, page: () => const Questions()),
  GetPage(name: AppRoutes.score, page: () => const Score()),
  GetPage(
      name: AppRoutes.informationsguest, page: () => const InformationGuest()),
];
