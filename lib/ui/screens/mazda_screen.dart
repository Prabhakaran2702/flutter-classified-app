import 'package:flutter/material.dart';

import 'package:flutter_classifiedappclone/Model/productModel.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/mainui_customcard.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/mainui_customcard_extended.dart';

import '../../model/Cars.dart';
import '../widgets/mazdaCustomCard.dart';



class MazdaScreen extends StatefulWidget {
  @override
  _MazdaScreenState createState() => _MazdaScreenState();
}

class _MazdaScreenState extends State<MazdaScreen> with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  TabController _controller;


  bool isExpanded = false;
  List<Cars> recommendListItems,recommendListItems1;
  double _height;
  double _width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 2, vsync: this);

    recommendListItems = [
      Cars(
          124,
          "05 Apr 2019",
          "MAZDA 3",
          "ENGINE TYPE - SKYACTIV-G 4 CYLINDER \n CAPACITY (CC) - 1998 \n POWER - 153 HP @ 6000 RPM",
          63000,"Sedan",
          "Pre-owned",
          8377028021,
          "assets/images/mazda1.png",
          true),
      Cars(
          123,
          "02 Apr 2019",
          "MAZDA 6",
          "ENGINE TYPE - SKYACTIV-G 4 CYLINDER \n CAPACITY (CC) - 1998 \n POWER - 153 HP @ 6000 RPM",  35000,
          "Sedan",
          "Pre-owned",
          8377028021,
          "assets/images/mazda2.png",
          true),
      Cars(
          125,
          "03 Dec 2018",
          "MAZDA MX-5",
          "ENGINE TYPE - SKYACTIV-G 4 CYLINDER \n CAPACITY (CC) - 1998 \n POWER - 153 HP @ 6000 RPM", 49500,
          "Convertible",
          "Pre-owned",
          8377028021,
          "assets/images/mx5.png",
          true),
    ];

    recommendListItems1 = [
      Cars(
          124,
          "05 Apr 2019",
          "MAZDA CX-5",
          "ENGINE TYPE - SKYACTIV-G 4 CYLINDER \n CAPACITY (CC) - 1998 \n POWER - 153 HP @ 6000 RPM", 63000,"Crossover SUV",
          "Pre-owned",
          8377028021,
          "assets/images/mazda-cx5.png",
          true),
      Cars(
          123,
          "02 Apr 2019",
          "MAZDA CX-9",
          "ENGINE TYPE - SKYACTIV-G 4 CYLINDER \n CAPACITY (CC) - 1998 \n POWER - 153 HP @ 6000 RPM", 35000,
          "Crossover SUV",
          "Pre-owned",
          8377028021,
          "assets/images/mazda-cx9.png",
          true),
      Cars(
          125,
          "03 Dec 2018",
          "MAZDA CX-30",  "ENGINE TYPE - SKYACTIV-G 4 CYLINDER \n CAPACITY (CC) - 1998 \n POWER - 153 HP @ 6000 RPM \n TORQUE - 200 NM @ 4000 RPM \n FUEL TANK CAPACITY – LITERS51 LITERS",
          49500,
          "Compact Crossover",
          "Pre-owned",
          8377028021,
          "assets/images/mazda-cx30.png",
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
          color: Colors.white, // <-- SEE HERE
        ),
        title: const Text('Mazda Cars',style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.black,
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
                  'assets/images/mazda_banners.png',
                ),
              ),
              new Container(
                decoration: new BoxDecoration(color: Colors.white),
                child: new TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  controller: _controller,
                  tabs: [
                    new Tab(
                      text: 'Sedan',
                    ),
                    new Tab(
                      text: 'SUV',
                    ),
                  ],
                ),
              ),
              Container(
                height: _height,
                child: new TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    trendingProducts(recommendListItems),
                    trendingProducts(recommendListItems1),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }


  Widget trendingProducts(List<Cars> list) {
    return Container(
      color: Colors.white54,
      height: _height,
      //width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) {
          return _buildTrendingEntries(context, index, list);
        },
      ),
    );
  }

  Widget _buildTrendingEntries(BuildContext context, int index, List<Cars> listItem) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(DETAIL_UI);
        print("Routing to trending list page");
      },
      child: MazdaCustomCard(
        title: '${listItem[index].title}',
        category: '${listItem[index].category}',
        price: "AED ${listItem[index].price}",
        type: '${listItem[index].type}',
        dateAdded: "${listItem[index].dateAdded}",
        description: "${listItem[index].desc}",
        image: "${listItem[index].image}",
        location: "Sector 62, Noida",
      ),
    );
  }



}
