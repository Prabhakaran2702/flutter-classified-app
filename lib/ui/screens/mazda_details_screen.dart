
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classifiedappclone/ui/screens/details/components/ProductDetails.dart';
import '../../model/Data.dart';
import '../widgets/custom_appbar.dart';
import 'details/components/body.dart';

class MazdaDetailsScreen extends  StatefulWidget {


  // Declare a field that holds the Person data
  final Data data;

  MazdaDetailsScreen({this.data});

  @override
  _MazdaDetailsScreen createState() => _MazdaDetailsScreen(data);

}

class _MazdaDetailsScreen extends State<MazdaDetailsScreen> {

  Data prf;
  _MazdaDetailsScreen(this.prf);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // <-- SEE HERE
        ),
        title: const Text('Car Details',style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.black,
      ),
      body: DetailBody(product: prf),
    );
  }

}




