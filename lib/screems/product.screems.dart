import 'package:flutter/widgets.dart';
import 'package:project/screems/product_show.screems.dart';
import '../models/product.model.dart';
import 'package:project/service/api.service.dart';
import 'package:flutter/material.dart';
class ProductsScreen extends StatefulWidget{
  static const routeName = 'products';
  const ProductsScreen({super.key});
   
   @override
   State<ProductsScreen> createState() => _ProductsScreenState();
}
  
class _ProductsScreenState extends State<ProductsScreen> {
  
 late Future<List<Product>> futureProduct;
  @override
  void initState(){
    super.initState();
    futureProduct = ApiService.fetchProducts();

  }

  @override
  
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: (){

              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent,
              ),
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Cart"), 
              ),
             
            )
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          
            child: FutureBuilder(
              future: futureProduct,
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                 if(snapshot.hasData){
                  return Center(
                    child:GridView.builder(
                      padding: const EdgeInsets.all(10.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                        return ProductCard(product: snapshot.data![index]);
                      }),
                  );
                 }



                return Center(child: Text("in progress"));
              },
              )
          ),
    );
  }
  ProductsScreen get widget => super.widget;
}


class ProductCard extends StatelessWidget{
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductShowScreen.routeName,
        arguments: product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
       child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ), 
        child: Stack(
          children: [
            Image.network(product.image, width: 200, height: 200,),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 11,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "/$product${product.price}", style: const TextStyle(
                        fontSize: 16, 
                        color: Colors.deepPurpleAccent),
                
                ),
                Text(product.title.length > 15
                  ? "${product.title.substring(0, 10)}..."
                    :product.title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    ),
                      ],
                    ),
              ),
              ),
                ],
            ),
       ),
          )
      );
    
   
  }
}