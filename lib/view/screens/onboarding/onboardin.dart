import 'package:flutter/material.dart';
import 'package:qcmapp/data/datasource/static/static.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              itemCount: onBoardingList.length,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      onBoardingList[index].image!,
                      width: 250,
                      height: 260,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    onBoardingList[index].title!,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Text(
                    onBoardingList[index].body!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: Container())
        ],
      )),
    );
  }
}
