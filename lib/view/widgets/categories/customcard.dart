import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.image,
    this.title,
    this.onTap,
  }) : super(key: key);

  final String? image;
  final String? title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 100,
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.blue[50],
          border: Border.all(width: 2, color: Colors.blue[200]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "$image",
              width: 80,
              height: 80,
              // height: 120,
            ),
            Text(
              "$title",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}
