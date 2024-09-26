import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/support_widget.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key, this.products = const []});
  final List<Product> products;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              AppWidget.appBar(
                  context: context,
                  title: Text(
                    "Cart",
                    style: AppWidget.semiboldTextStyle,
                  ),
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                  )),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 25.0,
                          child: Image.asset(
                            widget.products.elementAt(index).image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          widget.products.elementAt(index).title,
                          style: AppWidget.semiboldTextStyle,
                        ),
                        subtitle: Text(
                          "\$${widget.products.elementAt(index).price}",
                          style: AppWidget.lightTextStyle,
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
