import 'package:flutter/material.dart';

import '../../model/Data.dart';
import '../screens/details_screen.dart';

class CustomCardExtended extends StatelessWidget {
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


  CustomCardExtended({this.title, this.price, this.dateAdded, this.category,
      this.description, this.image, this.location});

  @override
  Widget build(BuildContext context) {


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

    _width= MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return   GestureDetector(onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailsScreen(data: data,
          )),),
    child:
      Card(
      elevation: 3,
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
                fit: BoxFit.cover,
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),

                Container(
                  width: _width / 2.5,
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
                            style: TextStyle(fontSize: 9),
                          ),
                        ),
                      ),

                       Flexible(
                         child: Container(
                         child : Text(
                             price,
                              style: TextStyle(color: Colors.grey[800],
                               fontWeight: FontWeight.w600,
                                 fontSize: 13,
                              ),),),)

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
                              Flexible(
                                child:  GestureDetector(
                                    child: Icon(Icons.favorite_border, size: _height/30,),
                                    onTap: (){
                                      print('Fav');
                                    },
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  (category=="Travel" || category== "Pre-owned")? SizedBox(
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
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]) ,
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
                 ] )
                      ] ) )

          ],
        ),



        ],
      ),
    ),
    ));
  }
}
