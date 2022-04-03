import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      title: 'Päron Logistics',
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  void _saveProduct() {
    final productName = _controller.text;

    FirebaseFirestore.instance.collection('Products');

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
            title: Text(doc['name']),
            subtitle: Text(doc['nr']),
            trailing: Text(doc['price'].toString() + ' kr'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          stream: FirebaseFirestore.instance.collection('Products').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LinearProgressIndicator();
            return Expanded(child: _buildList(snapshot.requireData));
          },
        )
      ]),
    );
  }
}
