import 'package:e_commerce_app/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    "images/headphone_icon.png",
    "images/laptop.png",
    "images/watch.png",
    "images/TV.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidget.appBar(context: context,
                profilePicturePath: "images/boy.jpg", name: "Name"),
            AppWidget.sectionBar(
                context: context, title: "Categories", trailing: "See all"),
            SizedBox(
              // margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              height: 130,
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CategoryTile(image: categories[index])),
            ),
            AppWidget.sectionBar(
                context: context, title: "Products", trailing: "See all"),
            SizedBox(
              height: 250,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  AppWidget.productItem(
                      context: context,
                      imagePath: "images/headphone2.png",
                      title: "Headphone",
                      price: "100"),
                  AppWidget.productItem(
                      context: context,
                      imagePath: "images/watch2.png",
                      title: "Watch",
                      price: "80"),
                  AppWidget.productItem(
                      context: context,
                      imagePath: "images/laptop2.png",
                      title: "Laptop",
                      price: "600")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String image;

  const CategoryTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.all(5.0),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          // margin: const EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          // height: 50,
          width: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              const Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }
}
