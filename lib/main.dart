import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qcmapp/binding.dart';
import 'package:qcmapp/core/services/services.dart';
import 'package:qcmapp/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //toujours si ona async dans le main
  await initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodyText1: const TextStyle(
              fontFamily: "Cairo",
              fontSize: 14,
              color: Colors.black,
              height: 2,
            ),
            bodyText2: const TextStyle(
              fontFamily: "Cairo",
              fontSize: 20,
              color: Colors.white,
              height: 2,
            ),
            headline1: const TextStyle(
              fontFamily: "Cairo",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline2: const TextStyle(
              fontFamily: "Cairo",
              fontSize: 30,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontFamily: "Cairo",
              fontSize: 35,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              color: Colors.green[900],
            ),
            headline4: const TextStyle(
              fontFamily: "Cairo",
              fontSize: 20,
              letterSpacing: 1,
              color: Colors.black87,
            ),
            headline5: const TextStyle(
              fontFamily: "Cairo",
              fontSize: 15,
              color: Colors.blue,
            ),
            headline6: const TextStyle(
              fontFamily: "Cairo",
              fontSize: 15,
              color: Colors.black,
            ),
          )),
      getPages: routes,
      // home: const SuccessSignUp(),
      initialBinding: MyBinding(),
    );
  }
}
