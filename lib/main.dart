import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/binding.dart';
import 'package:qcmapp/core/services/services.dart';
import 'package:qcmapp/routes.dart';
import 'package:qcmapp/view/screens/onboarding/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //toujours si ona async dans le main
  await initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontFamily: "Cairo",
              fontSize: 14,
              color: Colors.black,
              height: 2,
            ),
            headline1: TextStyle(
              fontFamily: "Cairo",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
      getPages: routes,
      initialBinding: MyBinding(),
    );
  }
}
