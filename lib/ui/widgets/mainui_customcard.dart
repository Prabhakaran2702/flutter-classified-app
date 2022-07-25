import 'package:flutter/material.dart';
import 'package:flutter_classifiedappclone/ui/screens/details_screen.dart';

import '../../model/Data.dart';
import '../screens/details/components/ProductDetails.dart';

class CustomCard extends StatelessWidget {
  double _width;
  double _height;
  double _aspectRatio;
  String title;
  String price;
  String dateAdded;
  String category;
  String description;
  String image;
  String location;



  CustomCard({this.title, this.price, this.dateAdded, this.category,
      this.description, this.image, this.location});

  @override
  Widget build(BuildContext context) {
    _width= MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    final data = Data(
      id: 1,
      images:
      image,
      title: title,
      price: price,
      description: description,
      rating: 4.8,
      category: category,
      isFavourite: true,);


    return   GestureDetector(
      onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => DetailsScreen(data: data,
      )),),
      child: Container(
        width: 350,
        child: Card(
          elevation: 3,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          color: Colors.grey[50],
          child: Container(
            padding: EdgeInsets.only(left: 10, top: 10, right: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: _width/2.9,
                  height: _width/2.8,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.all(2),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: _height/5,
                    width: _width/5,
                  ),
                ),

                SizedBox(
                  width: 10,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 150,
                      child:  Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(top: 16,bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(4),
                              color: Colors.grey[200],
                              child: Text(
                                category,
                                softWrap: true,
                                style: TextStyle(fontSize: 7),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              child : Text(
                                price,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Container(
                          width: 130,
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 11,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Container(
                        width: _width / 2.3,
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child:  GestureDetector(
                                child: Icon(Icons.favorite_border, size: _height/30,
                                  //           color:(isPressed) ? Color(0xff007397)
                                  // : Color(0xff9A9A9A)
                                ),
                                onTap: (){

                                },
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                (category=="Travel & Tourism" || category== "Pre-owned Cars")? SizedBox(
                                    width: 100,
                                    height : 30,
                                    // <-- Your width// <-- Your height
                                    child:  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[300]) ,
                                      ),
                                      onPressed: () {

                                      },
                                      child:  Text(
                                        "Enquiry now",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    )
                                ) :
                                SizedBox(
                                    width: 100,
                                    height : 30,
                                    // <-- Your width// <-- Your height
                                    child:  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[400]) ,
                                      ),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("One Item added to the cart"),
                                        ));
                                      },
                                      child:  Text(
                                        "Add to cart",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    )
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}
