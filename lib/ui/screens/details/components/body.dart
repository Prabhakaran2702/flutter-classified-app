import 'package:flutter/material.dart';


import '../../../../model/Data.dart';
import '../../../../size_config.dart';
import '../../../widgets/default_button.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class DetailBody extends StatelessWidget {
  final Data product;

  const DetailBody({Key key,  this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: getProportionateScreenWidth(15)),
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),

              TopRoundedContainer(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                    right:  getProportionateScreenWidth(40),
                    left:  getProportionateScreenWidth(40),
                    bottom: getProportionateScreenWidth(40),
                    top: getProportionateScreenWidth(50),
                  ),
                  child: (product.category=="Mazda Cars") ?   ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black) ,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Booking a test drive."),
                      ));
                    },

                    child:  Text(
                      "Book a test drive",
                      style: TextStyle(fontSize: 14),
                    ),
                  )
                      :
                  Container (child : (product.category=="Travel & Tourism" || product.category== "Pre-owned Cars") ?  DefaultButton(
                    text: "Enquiry now",
                    press: () {
                    },
                  ):
                  DefaultButton(
                    text: "Add To Cart",
                    press: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("One Item added to the cart"),
                      ));
                    },
                  ))


                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
