import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/pages/profile.dart';
import 'package:e_commerce_app/models/support_widget.dart';
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

  final String tempDetail =
      "This is good product, it have a 1 year warranty , These headphone are too good like you can also listen a person who is speaking slowly .But be aware of shivam he speaks very loudly"
      "This is good product, it have a 1 year warranty , These headphone are too good like you can also listen a person who is speaking slowly .But be aware of shivam he speaks very loudly"
      "This is good product, it have a 1 year warranty , These headphone are too good like you can also listen a person who is speaking slowly .But be aware of shivam he speaks very loudly"
      "This is good product, it have a 1 year warranty , These headphone are too good like you can also listen a person who is speaking slowly .But be aware of shivam he speaks very loudly";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidget.appBar(
                  context: context,
                  action: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile())),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'images/boy.jpg',
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    "Hey, Name",
                    style: AppWidget.boldTextStyle,
                  ),
                  subtitle: Text(
                    "Good Morning",
                    style: AppWidget.lightTextStyle,
                  ),
                  bottom: AppWidget.searchBox(context),
                ),
                SizedBox(
                  height: 5.0,
                ),
                AppWidget.scrollingView(
                  context,
                  children: [
                    AppWidget.sectionView(
                      context,
                      AppWidget.sectionBar(
                          context: context,
                          title: Text(
                            "Categories",
                            style: AppWidget.semiboldTextStyle,
                          ),
                          trailing:
                              AppWidget.textButton(context, "See All", () {})),
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
                    ),
                    AppWidget.sectionView(
                        context,
                        AppWidget.sectionBar(
                            context: context,
                            title: Text(
                              "Products",
                              style: AppWidget.semiboldTextStyle,
                            ),
                            trailing: AppWidget.textButton(
                                context, "See All", () {})),
                        AppWidget.sectionItems([
                          AppWidget.productItem(
                            context: context,
                            product: Product(
                                title: "Headphone",
                                image: "images/headphone2.png",
                                price: "100",
                                description: tempDetail,
                                id: '1'),
                          ),
                          AppWidget.productItem(
                            context: context,
                            product: Product(
                                title: "Watch",
                                image: "images/watch2.png",
                                price: "80",
                                description: tempDetail,
                                id: '2'),
                          ),
                          AppWidget.productItem(
                            context: context,
                            product: Product(
                                title: "Laptop",
                                image: "images/laptop2.png",
                                price: "600",
                                description: tempDetail,
                                id: '3'),
                          )
                        ])),
                    AppWidget.sectionView(
                        context,
                        AppWidget.sectionBar(
                            context: context,
                            title: Text(
                              "Products",
                              style: AppWidget.semiboldTextStyle,
                            ),
                            trailing: AppWidget.textButton(
                                context, "See All", () {})),
                        AppWidget.sectionItems([
                          AppWidget.productItem(
                            context: context,
                            product: Product(
                                title: "Headphone",
                                image: "images/headphone2.png",
                                price: "100",
                                description: tempDetail,
                                id: '1'),
                          ),
                          AppWidget.productItem(
                            context: context,
                            product: Product(
                                title: "Watch",
                                image: "images/watch2.png",
                                price: "80",
                                description: tempDetail,
                                id: '2'),
                          ),
                          AppWidget.productItem(
                            context: context,
                            product: Product(
                                title: "Laptop",
                                image: "images/laptop2.png",
                                price: "600",
                                description: tempDetail,
                                id: '3'),
                          )
                        ])),
                  ],
                )
              ],
            ),
          ),
        ));
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
