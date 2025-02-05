import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.model.dart';

class ApiService{


   static Future<List<Product>> fetchProducts() async {
   try {
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      List<dynamic> document = jsonDecode(response.body);
      return document.map((product) => Product.fromJson(product)).toList();
    }
    throw Exception("Erreur de connexion : ${response.statusCode}");
  } catch (e) {
    debugPrint("Erreur lors de la récupération des produits : $e");
    rethrow;
  }
}

}