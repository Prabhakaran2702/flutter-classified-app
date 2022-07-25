import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String title;

  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height/10,
      width: width,
      padding: EdgeInsets.only(left: 10, top: 25),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.orange[200], Colors.pinkAccent],
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: (){
                Navigator.of(context).pop();
              }),
          SizedBox(width: 70,),
          Text('$title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          SizedBox(width: 70,),
          IconButton(
              icon: Icon(Icons.shopping_cart,color: Colors.white,),
              onPressed: (){
                Navigator.of(context).pop();
              }),

        ],
      ),
    );
  }
}
