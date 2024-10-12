import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/support_widget.dart';
import 'package:e_commerce_app/pages/ProductDetail.dart';
import 'package:e_commerce_app/services/database.dart';
import 'package:flutter/material.dart';

class CategoryProduct extends StatefulWidget {
  String category;
  CategoryProduct({required this.category});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  Stream? CategoryStream;

  getontheload() async {
    CategoryStream = await DatabaseMethods().getProducts(widget.category);
    setState(() {});
  }

  initState() {
    getontheload();
    super.initState();
  }

  Widget allProducts() {
    return StreamBuilder(
        stream: CategoryStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return AppWidget.productItem(
                      context: context,
                      product: Product(
                        title: ds["Name"],
                        image: ds["Image"],
                        price: ds["Price"],
                        
                      ),
                      detail: ds["Detail"],
                    );

          //           return
          //           Container(child: Card(
          // color: Colors.white,
          // elevation: 5,
          // margin: const EdgeInsets.all(5.0),
          // child: Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Image.network(
          //         ds["Image"],
          //         height: 150,
          //         width: 150,
          //         fit: BoxFit.contain,
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Text(
          //        ds["Name"],
          //         style: AppWidget.semiboldTextStyle,
          //       ),
          //       Spacer(),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             "\$${ ds["Price"]}",
          //             style: TextStyle(
          //                 color: Theme.of(context).primaryColor,
          //                 fontSize: 22.0,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           const SizedBox(
          //             width: 30.0,
          //           ),
          //           GestureDetector(
          //             onTap: (){
          //               Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(detail: ds["Detail"], product: Product(title: ds["Name"], image: ds["Image"], price: ds["Price"]))));
          //             },
          //             child: Container(
          //                 padding: const EdgeInsets.all(5.0),
          //                 decoration: BoxDecoration(
          //                     color: Theme.of(context).primaryColor,
          //                     shape: BoxShape.circle),
          //                 child: GestureDetector(
          //                   onTap: () {},
          //                   child: const Icon(
          //                     Icons.add,
          //                     color: Colors.white,
          //                   ),
          //                 )),
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // )),);
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: const Color(0xfff2f2f2),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(child: allProducts()),
          ],
        ),
      ),
    );
  }
}
