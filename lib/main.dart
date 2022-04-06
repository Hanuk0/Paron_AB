import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'productpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: Colors.white,
      ),
      title: 'Päron Logistics',
      home: const ProductPage(),
    );
  }
}



/* KANSKE VILL ANVÄNDA SEN 

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  void _saveProduct() {
    //final productName = _controller.text;

    FirebaseFirestore.instance.collection(
        'Products'); //lägg till update här också för att uppdatera saldo

    _controller.clear();
  }

  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.docs.length,
        itemBuilder: (context, index) {
          final doc = snapshot.docs[
              index]; //för att kunna kalla på olika delar från ett doc, exempelvis doc['name']

          //Lista på produkter med namn, produktnummer och pris
          return ListTile(
            title: Text(doc['product']),
            subtitle: Text(doc['quantity'].toString()),
            trailing: Text(doc['city']),

            //trailing: const Icon(Icons.arrow_forward),

            onTap: () => MaterialPageRoute(
              builder: ((context) => const ProductPage()),
            ),
            // trailing: Text(doc['price'].toString() + ' kr'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
              child: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Productname'),
          )),
        ),
        ElevatedButton(
          child: const Text('Save'),
          onPressed: () {
            _saveProduct();
          },
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Stock').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LinearProgressIndicator();
            return Expanded(child: _buildList(snapshot.requireData));
          },
        )
      ]),
    ); 
  }
}

*/
