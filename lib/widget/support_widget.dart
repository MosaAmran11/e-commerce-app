import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.bold);
  }

  static TextStyle lightTextFieldStyle() {
    return const TextStyle(
        color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.w500);
  }

  static TextStyle semiboldTextFieldStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold);
  }

  static Widget sectionBar(
      {required BuildContext context,
      required String title,
      String trailing = ''}) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppWidget.semiboldTextFieldStyle(),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                trailing,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  static Card productItem(
      {required BuildContext context,
      required String imagePath,
      required String title,
      required String price}) {
    return Card(
        color: Colors.white,
        elevation: 5,
        margin: EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          // margin: EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
              Text(
                title,
                style: AppWidget.semiboldTextFieldStyle(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$$price",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ))
                ],
              )
            ],
          ),
        ));
  }

  static Column appBar(
      {required BuildContext context, required String profilePicturePath,
      required String name,
      String greeting = "Good Morning",
      Widget? bottom}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey, $name",
                  style: AppWidget.boldTextFieldStyle(),
                ),
                Text(
                  greeting,
                  style: AppWidget.lightTextFieldStyle(),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                profilePicturePath,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        bottom ?? const SizedBox(
          height: 30.0,
        ),
        bottom ?? Container(
          padding: const EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)),
          width: MediaQuery.of(context).size.width,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: AppWidget.lightTextFieldStyle(),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          ),
        ),
      ],
    );
  }
}
