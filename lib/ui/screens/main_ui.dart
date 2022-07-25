import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_classifiedappclone/Model/categoryModel.dart';
import 'package:flutter_classifiedappclone/Model/productModel.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/custom_shape.dart';
import 'package:flutter_classifiedappclone/UI/Widgets/mainui_customcard.dart';
import 'package:flutter_classifiedappclone/UI/screens/baskin_screen.dart';
import 'package:flutter_classifiedappclone/UI/screens/news_screen.dart';
import 'package:flutter_classifiedappclone/UI/screens/used_cars_screen.dart';
import 'package:flutter_classifiedappclone/ui/screens/cart/cart_screen.dart';
import 'package:flutter_classifiedappclone/ui/screens/mazda_screen.dart';
import 'package:flutter_classifiedappclone/ui/screens/profile/profile_screen.dart';

import 'its_screen.dart';


class MainUI extends StatefulWidget {
  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  var scaffoldKey = GlobalKey<ScaffoldState>();


  bool isExpanded = false;
  List<Category> categoryItems;
  List<Product> trendingListItems;
  List<Product> recommendListItems;
  List<Product> dealsListItems;
  double _height;
  double _width;

  int selectedPage = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingListItems = [

      Product(
          123,
          "02 Apr 2019",
          "Double Wowie",
          "Layered sundae with 2 Emlaaq scoops (6 Oz) ,Brownie chunks and Toppings",
          28,
          "5 months",
          "Ice cream & Cakes",
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
          "Ice cream & Cakes",
          8377028021,
          "assets/images/br2.png",
          true),
      Product(
          125,
          "23 Mar 2019",
          "Chocolate Indulgence",
          "Chocolate with Chocolate base cake (Serves up to 24 persons)",
          185,
          "5 months",
          "Ice cream & Cakes",
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
          "Ice cream & Cakes",
          8377028021,
          "assets/images/signature-sundaes2.jpg",
          true),

    ];
    recommendListItems = [
      Product(
          124,
          "05 Apr 2019",
          "MITSUBISHI OUTLANDER",
          "Make: Mitsubishi model: OUTLANDER Year: 2019 Body: TypeSUV",
          63000,
          "5 months",
          "Pre-owned Cars",
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
          "Pre-owned Cars",
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
          "Pre-owned Cars",
          8377028021,
          "assets/images/car3.jpg",
          true),
    ];


    dealsListItems = [
      Product(
          125,
          "02 Jan 2019",
          "Splendid Europe",
          "14 Nights 15 Days  Validity of Package/offer : April – September",
          10945,
          "5 months",
          "Travel & Tourism",
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
          "Travel & Tourism",
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
          "Travel & Tourism",
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
      bottomNavigationBar: _bottomNavBar(),
      key: scaffoldKey,
      drawer: _drawer(),
      body:  new Container(
        height: _height,
        width: _width,
        child: loadHomeScreen(selectedPage))
    );
  }

  Widget loadHomeScreen(int value){

      switch (value) {
        case 0:
       return homescreen();
          break;
        case 1:
          return CartScreen();
          break;
        case 2:
          return ProfileScreen();
          break;

      }
    }

  Widget homescreen(){
    return Container(
      height: _height,
      width: _width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            clipShape(),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15,top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Our Products',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black)),
                  GestureDetector(
                      onTap: _expand,
                      child: Text(
                        isExpanded ? "Show less" : "Show all",
                        style: TextStyle(
                            color: Colors.grey, fontSize: 14
                        ),
                      )),

                  //IconButton(icon: isExpanded? Icon(Icons.arrow_drop_up, color: Colors.orange[200],) : Icon(Icons.arrow_drop_down, color: Colors.orange[200],), onPressed: _expand)
                ],
              ),
            ),
            Divider(),

            Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              child: Card(
                elevation: 5,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                color: Colors.grey[50],
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 5,top: 17),
                  child:  expandList(),
                ),
              ),
            ),

            Divider(),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Special deals for you ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black)),
                  GestureDetector(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  BaskinRobbinScreen()),
                        );

                      },
                      child: Text(
                        'Show all',
                        style: TextStyle(
                            color: Colors.grey, fontSize: 14
                        ),
                      ))
                ],
              ),
            ),
            trendingProducts(),
            Divider(),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Popular deals",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black)),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ITSScreen()),
                        );
                      },
                      child: Text(
                        'Show all',
                        style: TextStyle(
                            color: Colors.grey, fontSize: 14
                        ),
                      ))
                ],
              ),
            ),
            todaysDeals(),
            Divider(),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10,bottom: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Pre-owned Cars",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black)),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  UsedCarsScreen()),
                        );
                      },
                      child: Text(
                        'Show all',
                        style: TextStyle(
                            color: Colors.grey, fontSize: 14
                        ),
                      ))
                ],
              ),
            ),
            recommendations(),

          ],
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          Opacity(
            opacity: 0.75,
            child: Container(
              height: _height / 6,
              padding: EdgeInsets.only(top: _height / 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.black,
                  ),
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                title: Text("Prabha"),
                subtitle: Text("prabhakaran@khaleejtimes.com",style: TextStyle(fontSize: 13),),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text("Account"),
          ),

          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Orders & Payments"),
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.contact_support_rounded),
            title: Text("About us"),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomAppBar(
      notchMargin: 4,
      shape: AutomaticNotchedShape(RoundedRectangleBorder(),RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child:  Container(
        margin: EdgeInsets.only(left: 50, right: 50),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  selectedPage = 0;
                });
              }
            ),

            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {

                setState(() {
                  selectedPage = 1;
                });

              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle_outlined),
              onPressed: () {

                setState(() {
                  selectedPage = 2;
                });

              },
            ),
          ],
        ),
      ),
      // onTap: (index){
      //   setState(() {
      //     selectedPage = index;
      //   });
      // },
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[100], Colors.orange[100],],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _height / 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.orange[100],],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.25,
          child: ClipPath(
            clipper: CustomShapeClipper3(),
            child: Container(
              height: _height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[100],Colors.orange[100],],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: _height / 8.3),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            elevation: 8,
            child: Container(
              child: TextFormField(
                cursorColor: Colors.orange[200],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon:
                  Icon(Icons.search, color: Colors.orange[200], size: 25),
                  hintText: "Search for a product or service",
                  hintStyle:  TextStyle(
                  color: Colors.black, fontSize: 14
    ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: _height / 5.4),
        child:  CarouselSlider(
            items: [

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://raw.githubusercontent.com/Prabhakaran2702/flutter-news-app/master/image3.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://raw.githubusercontent.com/Prabhakaran2702/flutter-news-app/master/image4.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://raw.githubusercontent.com/Prabhakaran2702/flutter-news-app/master/image1.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://raw.githubusercontent.com/Prabhakaran2702/flutter-news-app/master/image2.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),


            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 130.0,
              autoPlay: true,
              aspectRatio: 12 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ),

        Container(
          //color: Colors.blue,
            margin: EdgeInsets.only(left: 20, right: 20, top: _height / 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState.openDrawer();
                        },
                        child: Image.asset(
                          'assets/images/menubutton.png',
                          height: _height / 40,
                        )),
                  ),
                ),
                Flexible(
                  child: Container(
                    height: _height / 20,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            print('Editing location');
                          },
                          child: Icon(
                            Icons.edit_location,
                            color: Colors.white,
                            size: _height/40,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Flexible(
                            child: Text('Al Quoz, Dubai',
                                style: TextStyle(
                                    color: Colors.white, fontSize: _height/50),
                                // overflow: TextOverflow.fade,
                                softWrap: false)),
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child:    GestureDetector(
                        onTap: (){},
                        child:  Badge(
                            badgeColor : Colors.red,
                          badgeContent: Text('3', style: TextStyle( fontSize: 8,color: Colors.white),),
                          child: Icon(Icons.notifications, color: Colors.black,size: _height/30,)),
                        )

                  ),
                  )
              ],
            )),

      ],
    );
  }

  Widget expandList() {
    return Container(
      margin: EdgeInsets.only(left: 6, right: 6),
      child: AnimatedCrossFade(
        secondChild: MediaQuery.removePadding(
            context: context,
            removeTop: true,
          removeBottom: true,
            child:  GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 4,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  NewsScreen()),
                        );
                      },
                      child: Image.asset(
                        'assets/images/ic_kt.png',
                        height: _height / 22,
                        width: _width / 7,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                      child: Text(
                        "Latest News",
                        style: TextStyle( fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  BaskinRobbinScreen()),
                        );
                      },
                      child: Image.asset(
                        'assets/images/br.png',
                        height: _height / 22,
                        width: _width / 9,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                      child: Text(
                        "Food",
                        style: TextStyle( fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ITSScreen()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/holiday.png',
                          height: _height / 22,
                          width: _width / 6,
                        )),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                      child: Text(
                        "Travel",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  MazdaScreen()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/mazda.png',
                          height: _height / 22,
                          width: _width / 9,
                        )),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                      child: Text(
                        "Mazda",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  UsedCarsScreen()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/car.png',
                          height: _height / 22,
                          width: _width / 9,
                        )),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                      child: Text(
                        "Used Cars",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        //Navigator.of(context).pushNamed(BIKES_ITEM_LIST);
                        print('Routing to Bikes item list');
                      },
                      child: Image.asset(
                        'assets/images/heavy.png',
                        // fit: BoxFit.cover,
                        height: _height / 22,
                        width: _width / 6,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                      child: Text(
                        "Trucks",
                        style: TextStyle( fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          //Navigator.of(context).pushNamed(MOBILES_ITEM_LIST);
                          print('Routing to Mobiles item list');
                        },
                        child: Image.asset(
                          'assets/images/house.png',
                          height: _height / 22,
                          width: _width / 10,
                        )),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                      child: Text(
                        "Real Estate",
                        style: TextStyle( fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        //Navigator.of(context).pushNamed(PETS_ITEM_LIST);
                        print('Routing to Pets item list');
                      },
                      child: Image.asset(
                        'assets/images/investment.png',
                        height: _height / 22,
                        width: _width / 10,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                      child: Text(
                        "Investments",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
        firstChild:   MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child:  GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  NewsScreen()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/ic_kt.png',
                      height: _height / 22,
                      width: _width / 7,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Flexible(
                    child: Text(
                      "Latest News",
                      style: TextStyle( fontSize: 13),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  BaskinRobbinScreen()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/br.png',
                      height: _height / 22,
                      width: _width / 9,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Flexible(
                    child: Text(
                      "Food",
                      style: TextStyle( fontSize: 13),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ITSScreen()),
                        );
                      },
                      child: Image.asset(
                        'assets/images/holiday.png',
                        height: _height / 22,
                        width: _width / 6,
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  Flexible(
                    child: Text(
                      "Travel",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  MazdaScreen()),
                        );
                      },
                      child: Image.asset(
                        'assets/images/mazda.png',
                        height: _height / 22,
                        width: _width / 9,
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  Flexible(
                    child: Text(
                      "Mazda",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        crossFadeState:
        isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      ),
    );
  }

  Widget trendingProducts() {
    return Container(
      height: _height / 4.25,
      //width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        shrinkWrap: true,
        itemCount: trendingListItems.length,
        scrollDirection: Axis.horizontal,
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
