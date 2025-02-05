
//import 'dart:convert';
//import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:project/screems/product.screems.dart';
import 'package:project/screems/product_show.screems.dart';
void main(){
  runApp(const MyTutorialApp());
}
class MyTutorialApp extends StatelessWidget {
  const MyTutorialApp ({super.key});

  @override
  Widget build(BuildContext context){
  return MaterialApp(
    title:'Products',
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
    routes: {
      ProductsScreen.routeName: (context) => const ProductsScreen(),
      ProductShowScreen.routeName: (context) => const ProductShowScreen(),
    },
    initialRoute: ProductsScreen.routeName,
  );
}
}
/*class _MyTutorialAppState extends State<MyTutorialApp> {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking & APIs',
      theme: ThemeData(
         primarySwatch: Colors.deepPurple,
      ),
      routes: {
        ProductsScreen.routeName: (context) => const ProductsScreen(),
      },
      initialRoute: ProductsScreen.routeName,
    );
  }
*/
























/*import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(
    home: MyHomePage()
  ));
}//runApp prend un widget et defini un widget

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});//pour optimise son application
  @override
  Widget build(BuildContext context) {
      return Scaffold(//Ajouter une image en ligne
        appBar: AppBar(title: Text("Appli"),elevation: 12,),
        body: Center(child: Text("Bonjour"),),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.add),
        ),
      );
      //child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS36xsmM2n3kOTy6gaVeJu1v4t2Wcf7dY_gfg&s"));//Pour que le texte s'affiche on doit donner a direction du texte
      /*child: Text(
        "Home page",
        textDirection: TextDirection.ltr,
        ),
      );*/
      //Centre les elements au centre
    
  }//Override returne un widgte
}*///La classe Stateless implémnte La méthode build qui indique l'élément qu'on va afficher
//Build prend en parametre un contexte. 

/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyTutorialApp extends StatefulWidget {
  @override
  _MyTutorialAppState createState() => _MyTutorialAppState();
}

class _MyTutorialAppState extends State<MyTutorialApp> {
  late Future<List<Product>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking & APIs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: FutureBuilder<List<Product>>(
            future: futureProduct,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('Aucun produit trouvé'));
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.description),
                    trailing: Text("\$${product.price.toStringAsFixed(2)}"),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<List<Product>> fetchProduct() async {
    var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      List document = jsonDecode(response.body);
      return document.map((product) => Product.fromJson(product)).toList();
    }
    throw Exception("Une erreur est survenue");
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['title'], // Correction pour correspondre à l'API
      description: json['description'],
      price: json['price'] is double ? json['price'] : double.parse("${json['price']}"),
    );
  }
}

void main() => runApp(MyTutorialApp());
























/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
/// Flutter code sample for [FutureBuilder].

void main() => runApp(const FutureBuilderExampleApp());

class FutureBuilderExampleApp extends StatelessWidget {
  const FutureBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FutureBuilderExample(),
    );
  }
  Future<List<Product>> fetchProduct() async {
    return [];
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,

  });
}
*/


class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}

*/

































/*enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Color.fromRGBO(255, 152, 0, 1)),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}*/




/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}*/







/*class MyCupertinoApp extends StatelessWidget {

  const MyCupertinoApp({super.key});//clé généré par flutter
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Cupertino Demo'),
        ),
      
      child: Center(
        child: CupertinoButton(
          onPressed: (){
            print('Button Pressed');
          },
          child: const Text('Button'),
        ) ,
      
    )),
    );
  }
}*/// StatelessWidget pour des éléments static




/*class MyMaterialApp extends StatelessWidget {
  MyMaterialApp({super.key});

  final List<String> list = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: list
                  .map((element) => Padding(
                        padding: const EdgeInsets.all(7),
                        child: Container(
                          color: Colors.deepPurple,
                          height: 70,
                          width: 30,
                          child: Center(
                            child: Text(
                              element,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
} */





      /*home: Scaffold(
        body: Container(
          color: Colors.deepPurple,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () { },
                  child: Text('TextButton'),
                ),

                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                          }
                          return null; // Use the component's default.
                        },
                      ),
                    ),
                    child: const Text('Fly me to the moon'),
                    onPressed: () {
                      child: Text('TextButton1');
                    },
                  ),
              ],
            ),
          ),
        ),
        
      */
     

/*class ColorDropdownMenu extends StatefulWidget {
  const ColorDropdownMenu({Key? key}) : super(key: key);

  @override
  State<ColorDropdownMenu> createState() => _ColorDropdownMenuState();
}*/

/*class _ColorDropdownMenuState extends State<ColorDropdownMenu> {
  ColorLabel selectedColor = ColorLabel.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Menu Example'),
      ),
      body: Center(
        child: DropdownButton<ColorLabel>(
          value: selectedColor,
          items: ColorLabel.values.map((ColorLabel color) {
            return DropdownMenuItem<ColorLabel>(
              value: color,
              child: Text(
                color.label,
                style: TextStyle(color: color.color),
              ),
            );
          }).toList(),
          onChanged: (ColorLabel? newColor) {
            if (newColor != null) {
              setState(() {
                selectedColor = newColor;
              });
            }
          },
        ),
      ),
    );
  }
}*/


/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}*/



// StatelessWidget pour des éléments dynamiques


/*
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,       
        title: Text(widget.title),
      ),
      body: Center(   
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'the button ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/