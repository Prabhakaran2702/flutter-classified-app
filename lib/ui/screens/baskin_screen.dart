import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_classifiedappclone/Model/categoryModel.dart';
import 'package:flutter_classifiedappclone/Model/productModel.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/custom_shape.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/mainui_customcard.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/mainui_customcard_extended.dart';
import 'package:flutter_classifiedappclone/UI/screens/news_screen.dart';


class BaskinRobbinScreen extends StatefulWidget {
  @override
  _BaskinRobbinScreenState createState() => _BaskinRobbinScreenState();
}

class _BaskinRobbinScreenState extends State<BaskinRobbinScreen> with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  TabController _controller;


  bool isExpanded = false;
  List<Category> categoryItems;
  List<Product> trendingListItems;
  List<Product> recommendListItems;
  List<Product> dealsListItems;
  double _height;
  double _width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
    trendingListItems = [

      Product(
          123,
          "02 Apr 2019",
          "Double Wowwie",
          "Layered sundae with 2 Emlaaq scoops (6 Oz) ,Brownie chunks and Toppings",
          28,
          "5 months",
          "Ice cream",
          8377028021,
          "assets/images/br1.png",
          true),
      Product(
          124,
          "05 Apr 2019",
          "BR Squad",
          "2 Value Packs approximately 20 scoops with 5 Sugar Cones, 2 Dry Toppings, Decorous Ceramic Scooper",
          99,
          "5 months",
          "Ice cream",
          8377028021,
          "assets/images/br2.png",
          true),

      Product(
          124,
          "05 Apr 2019",
          "Happiness Pack",
          "2 Value Packs approximately 20 scoops with 5 Sugar Cones, 2 Dry Toppings, Decorous Ceramic Scooper",
          99,
          "5 months",
          "Ice cream",
          8377028021,
          "assets/images/happiness-pack.jpg",
          true),
      Product(
          125,
          "23 Mar 2019",
          "Chocolate Indulgence",
          "Chocolate with Chocolate base cake (Serves up to 24 persons)",
          185,
          "5 months",
          "Cake",
          8377028021,
          "assets/images/chocolate-indulgence.jpg",
          true),
      Product(
          123,
          "02 Apr 2019",
          "Signature Sundaes",
          "Layered sundae with 2 Emlaaq scoops (6 Oz) ,Brownie chunks and Toppings",
          28,
          "5 months",
          "Ice cream",
          8377028021,
          "assets/images/signature-sundaes2.jpg",
          true),


    ];


  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Baskin Robins',style: TextStyle(
        color: Colors.black,
      ),),
        backgroundColor: Colors.white,
      ),
      key: scaffoldKey,
      body: Container(
        height: _height,
        width: _width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
               Container(
                 child:  Image.asset(
                   'assets/images/br_banner.png',
                 ),
               ),
              new Container(
                decoration: new BoxDecoration(color: Colors.white),
                child: new TabBar(
                  labelColor: Colors.blue[900],
                  indicatorColor: Colors.blue[900],
                  controller: _controller,
                  tabs: [
                    new Tab(
                      text: 'Indulge',
                    ),
                    new Tab(
                      text: 'Flavours',
                    ),
                    new Tab(
                      text: 'Cakes',
                    ),
                    new Tab(
                      text: 'Shakes',
                    ),
                  ],
                ),
              ),
               Container(
                 height: _height,
                child: new TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    trendingProducts(),
                    trendingProducts(),
                    trendingProducts(),
                    trendingProducts(),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }


  Widget trendingProducts() {
    return Container(
      color: Colors.white54,
      height: _height,
      //width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
        itemCount: trendingListItems.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) {
          return _buildTrendingEntries(context, index, trendingListItems);
        },
      ),
    );
  }

  Widget _buildTrendingEntries(BuildContext context, int index, List<Product> listItem) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(DETAIL_UI);
        print("Routing to trending list page");
      },
      child: CustomCardExtended(
        title: '${listItem[index].title}',
        category: '${listItem[index].category}',
        price: "AED ${listItem[index].price}",
        dateAdded: "${listItem[index].dateAdded}",
        description: "${listItem[index].desc}",
        image: "${listItem[index].image}",
        location: "Sector 62, Noida",
      ),
    );
  }

  Widget recommendations() {
    return Container(
      height: _height / 4.25,
      //width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
        itemCount: recommendListItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return _buildRecommendationsEntries(
              context, index, recommendListItems);
        },
      ),
    );
  }

  Widget _buildRecommendationsEntries(BuildContext context, int index, List<Product> listItem) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).pushNamed(DETAIL_UI);
        print("Routing to detail page");
      },
      child: CustomCard(
        title: '${listItem[index].title}',
        category: '${listItem[index].category}',
        price: "AED ${listItem[index].price}",
        dateAdded: "${listItem[index].dateAdded}",
        description: "${listItem[index].desc}",
        image: "${listItem[index].image}",
        location: "Sector 62, Noida",
      ),
    );
  }

  Widget todaysDeals() {
    return Container(
      height: _height / 4.25,
      //width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
        itemCount: dealsListItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return _buildDealsEntries(context, index, dealsListItems);
        },
      ),
    );
  }

  Widget _buildDealsEntries(BuildContext context, int index, List<Product> listItem) {
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).pushNamed(DETAIL_UI);
        print("Routing to detail page");
      },
      child: CustomCard(
        title: '${listItem[index].title}',
        category: '${listItem[index].category}',
        price: "AED ${listItem[index].price}",
        dateAdded: "${listItem[index].dateAdded}",
        description: "${listItem[index].desc}",
        image: "${listItem[index].image}",
        location: "Sector 62, Noida",
      ),
    );
  }
}
