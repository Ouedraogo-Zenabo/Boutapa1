import 'package:flutter/material.dart';

class ProductShowScreen extends StatelessWidget{
  static const routeName = 'product_show.screems';
  const ProductShowScreen({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductShowScreen"),
      ),
      body: Center(
        child: Text("ProductShowScreen"),
      ),
    );
  }
}