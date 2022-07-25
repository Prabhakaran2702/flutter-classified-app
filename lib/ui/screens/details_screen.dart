
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_classifiedappclone/ui/screens/details/components/ProductDetails.dart';
import '../../model/Data.dart';
import '../widgets/custom_appbar.dart';
import 'details/components/body.dart';

class DetailsScreen extends  StatefulWidget {


  // Declare a field that holds the Person data
  final Data data;

  DetailsScreen({this.data});

  @override
  _DetailsScreen createState() => _DetailsScreen(data);


}

class _DetailsScreen extends State<DetailsScreen> {

  Data prf;
  _DetailsScreen(this.prf);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar("Product Detail"),
      ),
      body: DetailBody(product: prf),
    );
  }

}




