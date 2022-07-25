import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_classifiedappclone/Model/categoryModel.dart';
import 'package:flutter_classifiedappclone/Model/productModel.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/custom_shape.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/mainui_customcard.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/mainui_customcard_extended.dart';
import 'package:flutter_classifiedappclone/UI/screens/news_screen.dart';


class UsedCarsScreen extends StatefulWidget {
  @override
  _UsedCarsScreenState createState() => _UsedCarsScreenState();
}

class _UsedCarsScreenState extends State<UsedCarsScreen> with SingleTickerProviderStateMixin {
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

    recommendListItems = [
      Product(
          124,
          "05 Apr 2019",
          "MITSUBISHI OUTLANDER",
          "Make: Mitsubishi model: OUTLANDER Year: 2019 Body: TypeSUV",
          63000,
          "5 months",
          "Pre-owned",
          8377028021,
          "assets/images/car1.jpg",
          true),
      Product(
          123,
          "02 Apr 2019",
          "RENAULT MEGAN",
          "Make: Renault model: MEGAN Year: 2018",
          35000,
          "5 months",
          "Pre-owned",
          8377028021,
          "assets/images/car2.jpg",
          true),
      Product(
          125,
          "03 Dec 2018",
          "MAZDA BT-50",
          "Make: Mazda model: BT-50 Year: 2019",
          49500,
          "5 months",
          "Pre-owned",
          8377028021,
          "assets/images/car3.jpg",
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
        iconTheme: IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
        title: const Text('Preowned Cars',style: TextStyle(
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
                  'assets/images/used_cars_banner.png',
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
                      text: 'MAZDA',
                    ),
                    new Tab(
                      text: 'RENAULT',
                    ),
                    new Tab(
                      text: 'DODGE',
                    ),
                    new Tab(
                      text: 'MITSUBISHI',
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
        itemCount: recommendListItems.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) {
          return _buildTrendingEntries(context, index, recommendListItems);
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
