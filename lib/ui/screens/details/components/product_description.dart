import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../constants.dart';
import '../../../../model/Data.dart';
import '../../../../size_config.dart';
import 'ProductDetails.dart';


class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Data product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

    Padding(
    padding:
    EdgeInsets.only(left: getProportionateScreenWidth(20),right: getProportionateScreenWidth(20),bottom: getProportionateScreenWidth(10)),
    child:  Text(
      product.category,
      style: TextStyle(
          fontWeight: FontWeight.w600, color: kPrimaryColor),
    ),
    ),

        Padding(
          padding:
              EdgeInsets.only(left: getProportionateScreenWidth(20),right: getProportionateScreenWidth(20),bottom: getProportionateScreenWidth(10)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
               Text(
                product.price,
                style: Theme.of(context).textTheme.headline6,
              ),
    ])),

        Padding(
            padding:
            EdgeInsets.only(left: getProportionateScreenWidth(20),bottom: getProportionateScreenWidth(10),top: getProportionateScreenWidth(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "More Details",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor,fontSize: 16),
                  ),
                  Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    width: getProportionateScreenWidth(64),
                    decoration: BoxDecoration(
                      color:
                      product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color:
                      product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                      height: getProportionateScreenWidth(16),
                    ),
                  ),
                ])),

        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            product.description+" "+ product.description,  style: TextStyle(fontSize: 14),
          ),
        ),

      ],
    );
  }
}
