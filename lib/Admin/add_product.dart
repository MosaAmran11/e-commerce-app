import 'dart:async';
import 'dart:io';
import 'package:e_commerce_app/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/support_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker _picker = ImagePicker();

  File? selectedImage;
  TextEditingController namecontroller = TextEditingController();
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

uploadItem() async {
  // Default image URL from Firebase Storage
  String defaultImageUrl = "https://firebasestorage.googleapis.com/v0/b/yemen-storee.appspot.com/o/purple.jpg?alt=media&token=d52215c3-38ed-4107-8164-1191938ba0e1";

  // If no image is selected, use the default image URL
  String imageUrl;

  if (selectedImage != null) {
    // Upload the selected image
    String addId = randomAlphaNumeric(10);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child("productImages").child(addId);

    final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
    imageUrl = await (await task).ref.getDownloadURL();  // Get the uploaded image URL
  } else {
    // If no image is selected, use the default image URL
    imageUrl = defaultImageUrl;
  }

  // Check if the name field is not empty
  if (namecontroller.text.isNotEmpty) {
    Map<String, dynamic> addProduct = {
      "Name": namecontroller.text,
      "Image": imageUrl,
    };

    await DatabaseMethods().addProduct(addProduct, value!).then((value) {
      selectedImage = null; // Reset selectedImage
      namecontroller.clear(); // Clear the text input
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Product has been uploaded Successfully",
            style: TextStyle(fontSize: 20.0),
          )));
    });
  } else {
    // If the name field is empty, show an error message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Product name cannot be empty",
          style: TextStyle(fontSize: 20.0),
        )));
  }
}


  // uploadItem() async {
  //   if (selectedImage != null && namecontroller.text != "") {
  //     String addId = randomAlphaNumeric(10);
  //     Reference firebaseStorageRef =
  //         FirebaseStorage.instance.ref().child("blogImage").child(addId);

  //     final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
  //     var downloadUrl = await (await task).ref.getDownloadURL();

  //     Map<String, dynamic> addProduct = {
  //       "Name": namecontroller.text,
  //       "Image": downloadUrl,
  //     };
  //     await DatabaseMethods().addProduct(addProduct, value!).then((value) {
  //       selectedImage = null;
  //       namecontroller.text = "";
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           backgroundColor: Colors.redAccent,
  //           content: Text(
  //             "Product has been uploaded Successfully",
  //             style: TextStyle(fontSize: 20.0),
  //           )));
  //     });
  //   }
  // }

  String? value;
  final List<String> categoryitem = ['Watch', 'Laptop', 'TV', 'Headphones'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          "Add Product",
          style: AppWidget.semiboldTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upload the product Image",
              style: AppWidget.semiboldTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            selectedImage == null
                ? GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  )
                : Center(
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Product name",
              style: AppWidget.lightTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Product Category",
              style: AppWidget.lightTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: categoryitem
                      .map(
                        (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: AppWidget.semiboldTextStyle,
                            )),
                      )
                      .toList(),
                  onChanged: ((value) => setState(
                        () {
                          this.value = value;
                        },
                      )),
                  dropdownColor: Colors.white,
                  hint: Text("Select category"),
                  iconSize: 36,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  value: value,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      uploadItem();
                    },
                    child: Text(
                      "Add Product",
                      style: TextStyle(fontSize: 22),
                    )))
          ],
        ),
      ),
    );
  }
}
