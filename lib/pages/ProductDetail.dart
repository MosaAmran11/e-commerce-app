import 'package:e_commerce_app/widget/support_widget.dart';
import 'package:flutter/material.dart';

class Productdetail extends StatefulWidget {
  const Productdetail({super.key});

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef5f1),
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              
              children: [ GestureDetector(
                
                onTap: (){
                  Navigator.pop(context);
                },
              child :Container(
                
                padding: EdgeInsets.all(10.0),

                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(Icons.arrow_back_ios_new_outlined),
              ),
              ),
              Center(
              child: Image.asset("images/headphone2.png",
              height: 400,),
              ),
           ] ),
           Expanded(
             child: Container(
              padding: EdgeInsets.only(top: 20.0,left: 20.0 ,right: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Headphone",style: AppWidget.boldTextFieldStyle(),),
                  Text("\$300",
                    style: TextStyle(
                      color: Color(0xFFfd6f3e),
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text("Details",
              style: AppWidget.semiboldTextFieldStyle(),
              ),
              SizedBox(height: 10.0,),
              Text("This is good product, it have a 1 year waranty , These headphone are too good like you can also listen a person who is speaking slowly .But be  awre of shivam he speaks very loadly"),
              SizedBox(height: 90,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xffFd6f3e),
                  borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text("Boy Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              )
                ],
              )
             ),
           )
            
          ],
        ),
      ),
    );
  }
}