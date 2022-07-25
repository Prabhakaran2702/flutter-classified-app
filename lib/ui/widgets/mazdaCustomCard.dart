import 'package:flutter/material.dart';
import 'package:flutter_classifiedappclone/ui/screens/mazda_details_screen.dart';

import '../../model/Data.dart';

class MazdaCustomCard extends StatelessWidget {
  double _width;
  double _height;
  double _aspectRatio;
  String title;
  String price;
  String dateAdded;
  String category;
  String type;
  String description;
  String image;
  String location;

  MazdaCustomCard({this.title, this.price, this.dateAdded, this.category,
    this.description, this.image, this.location,this.type});

  @override
  Widget build(BuildContext context) {
    _width= MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    final data = Data(
      id: 1,
      images:
      image,
      title: title,
      price: "Sedan type",
      description: description,
      rating: 4.8,
      category: "Mazda Cars",
      isFavourite: false,);

    return GestureDetector(
        onTap: () =>
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MazdaDetailsScreen(data: data,
            )),
      ),

    child: Card(
      elevation: 5,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only( top: 10, right: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Container(
              width: _width/3,
              height: _width/3,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.orange[50],
              ),
              padding: EdgeInsets.all(2),
              child: Image.asset(
                image,
                fit: BoxFit.scaleDown,
                height: _height/5,
                width: _width/5,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child:  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,color: Colors.grey[800],),
                  ),
                ),

                Container(
                    width: _width / 2.2,
                    padding: EdgeInsets.only(top: 4,bottom: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Flexible(
                            child: Container(
                              child : Text(
                                type,
                                style: TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),),),),

                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.only(right: 10,left: 10,top :4,bottom: 4),
                              color: Colors.grey[200],
                              child: Text(
                                "E-Brochure",
                                softWrap: true,
                                style: TextStyle(fontSize: 9),
                              ),
                            ),
                          ),



                        ] ) ),

                Container(
                    padding: EdgeInsets.all(6),
                    width: _width / 2,
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 11,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    )),

                Container(
                    padding: EdgeInsets.all(6),
                    width: _width / 2.2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          SizedBox(
                              width: 120,
                              height : 30,
                              // <-- Your width// <-- Your height
                              child:  ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black) ,
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("One Item added to the cart"),
                                  ));
                                },
                                child:  Text(
                                  "Book a test drive",
                                  style: TextStyle(fontSize: 10),
                                ),
                              )
                          ),
                        ] ) )

              ],
            ),



          ],
        ),
      ),
    )
    );



  }
}
