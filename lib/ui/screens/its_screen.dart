import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_classifiedappclone/Model/categoryModel.dart';
import 'package:flutter_classifiedappclone/Model/productModel.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/custom_shape.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/mainui_customcard.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/mainui_customcard_extended.dart';
import 'package:flutter_classifiedappclone/UI/screens/news_screen.dart';


class ITSScreen extends StatefulWidget {
  @override
  _ITSScreenState createState() => _ITSScreenState();
}

class _ITSScreenState extends State<ITSScreen> with SingleTickerProviderStateMixin {
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

    dealsListItems = [
      Product(
          125,
          "02 Jan 2019",
          "Splendid Europe",
          "14 Nights 15 Days  Validity of Package/offer : April – September",
          10945,
          "5 months",
          "Travel",
          8377028021,
          "assets/images/europe.jpg",
          true),
      Product(
          126,
          "10 Apr 2019",
          "Spanish Fiesta",
          "10 Nights 11 Days  Validity of Package/offer : April – September",
          7100,
          "5 months",
          "Travel",
          8377028021,
          "assets/images/lisbon.jpg",
          true),
      Product(
          124,
          "05 Mar 2019",
          "GRAND TOUR OF USA",
          "17 Nights 18 Days  City Tour on SIC: New York, Washington D.C, Miami, San Francisco , Las Vegas, Los Angeles",
          11500,
          "5 months",
          "Travel",
          8377028021,
          "assets/images/usa.jpg",
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
        title: const Text('International travel service'),
        backgroundColor: Colors.pink[400],
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
                  'assets/images/its_banner.png',
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
                      text: 'Spain',
                    ),
                    new Tab(
                      text: 'Japan',
                    ),
                    new Tab(
                      text: 'United States',
                    ),
                    new Tab(
                      text: 'United Kingdom',
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
        itemCount: dealsListItems.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) {
          return _buildTrendingEntries(context, index, dealsListItems);
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
