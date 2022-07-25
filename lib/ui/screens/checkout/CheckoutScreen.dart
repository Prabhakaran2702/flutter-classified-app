import 'package:flutter/material.dart';

import '../../../UI/widgets/custom_appbar.dart';
import '../../../constants/colors.dart';
import '../../../size_config.dart';
import '../../widgets/price_breakdown.dart';
import '../../widgets/tab_title.dart';
import '../order_success/login_success_screen.dart';


class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TabTitle(
                    title: 'Delivery Address',
                    actionText: 'Change',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DestinationCard(),
                        Divider(
                          height: getProportionateScreenHeight(25),
                        ),
                        Text(
                          'Choose payment method',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Divider(
                          height: getProportionateScreenHeight(25),
                        ),
                        PaymentCard(
                          isSelected: true,
                          title: '**** 2456',
                          image:  "assets/images/mastercard-2.png",
                        ),
                        PaymentCard(title: 'Apple pay', image:  "assets/images/apple-pay.png",),
                        PaymentCard(title: 'Cash on delivery', image:  "assets/images/success.png",),
                        Divider(
                          height: getProportionateScreenHeight(30),
                        ),
                        PriceBreakdown(
                          title: 'Sub total Price',
                          price: 'AED 155',
                        ),
                        PriceBreakdown(
                          title: 'Delivery Fee',
                          price: ' 8',
                        ),
                        PriceBreakdown(
                          title: 'Voucher redeem',
                          price: 'None',
                        ),
                        PriceBreakdown(
                          title: 'Total price',
                          price: 'AED 163',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16.0),
              ),
              child: ElevatedButton(
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderSuccessScreen()));

                },
                child: Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key key,
    this.isSelected = false,
    this.title,
    this.image
  }) : super(key: key);

  final bool isSelected;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(48),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(8.0),
      ),
      margin: EdgeInsets.only(
        bottom: getProportionateScreenHeight(16.0),
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(
            8,
          ),
        ),
        boxShadow: [
          isSelected
              ? BoxShadow(
            color: kShadowColor,
            offset: Offset(
              getProportionateScreenWidth(24),
              getProportionateScreenWidth(40),
            ),
            blurRadius: 80,
          )
              : BoxShadow(color: Colors.transparent),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child:   Image.asset(image,
        height: 50, //40%
      ),
            width: getProportionateScreenWidth(40),
            height: getProportionateScreenWidth(40),
            decoration: ShapeDecoration(
              color: kGreyShade5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(8.0),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(8),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: getProportionateScreenHeight(96), width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ Container(
            padding: EdgeInsets.all(15),
            child: Image.asset("assets/images/delivery.png", height: 50,),
            height: getProportionateScreenWidth(80,),
            width: getProportionateScreenWidth(80,),
            decoration: ShapeDecoration(color: kGreyShade5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(8.0),),),),),
          SizedBox(width: getProportionateScreenWidth(8.0),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Prabhakaran Dhanagopal',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Flexible(
                  child: Text(
                    'MAG 218, Al Marsa street, Dubai Marina',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: kTextColorAccent,
                    ),
                    softWrap: true,
                  ),
                ),
                Text(
                  '(+78) 8989 8787',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: kTextColorAccent,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
