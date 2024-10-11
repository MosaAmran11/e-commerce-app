import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/pages/ProductDetail.dart';
import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextStyle = const TextStyle(
      color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.bold);

  static TextStyle lightTextStyle = const TextStyle(
      color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.w500);

  static TextStyle semiboldTextStyle = const TextStyle(
      color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold);

  static Widget textButton(
      BuildContext context, String text, VoidCallback? onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget textField(BuildContext context, String labelText,
      [TextEditingController? textController, bool obscureText = false]) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your ${labelText.toLowerCase()}";
          }
          return null;
        },
        controller: textController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }

    static Widget textFieldAdmin(BuildContext context, String labelText,
      [TextEditingController? textController]) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: textController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }

  static Widget sectionBar(
      {required BuildContext context,
      required Widget title,
      Widget? trailing}) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title,
            trailing ?? const SizedBox(),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  static Widget productItem(
      {required BuildContext context, required Product product}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      product: product,
                    )));
      },
      child: Card(
          color: Colors.white,
          elevation: 5,
          margin: const EdgeInsets.all(5.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Image.asset(
                  product.image,
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                ),
                Text(
                  product.title,
                  style: AppWidget.semiboldTextStyle,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
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
          )),
    );
  }

  static Widget appBar(
      {required BuildContext context,
      Widget? title,
      Widget? leading,
      Widget? subtitle,
      Widget? action,
      Widget? bottom}) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading ?? const SizedBox(),
            leading != null
                ? const SizedBox(
                    width: 2.0,
                  )
                : const SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title ?? const SizedBox(),
                subtitle ?? const SizedBox()
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            action ?? const SizedBox()
          ],
        ),
        bottom != null
            ? const SizedBox(
                height: 30.0,
              )
            : const SizedBox(),
        bottom ??
            const SizedBox(
              height: 30.0,
            ),
      ],
    );
  }

  static Widget searchBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      width: MediaQuery.of(context).size.width,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: AppWidget.lightTextStyle,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  static Widget sectionItems(List<Widget> children) {
    return SizedBox(
      height: 250,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: children,
      ),
    );
  }

  static Widget sectionView(
      BuildContext context, Widget sectionBar, Widget sectionItems) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [sectionBar, sectionItems]),
    );
  }

  static Widget scrollingView(BuildContext context,
      {List<Widget> children = const []}) {
    return Expanded(
      child: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
      ),
    );
  }
}
