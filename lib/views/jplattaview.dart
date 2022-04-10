import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../edit/jplattaedit.dart';

class JPlattaView extends StatefulWidget {
  JPlattaView({Key? key}) : super(key: key);

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  State<JPlattaView> createState() => _JPlattaViewState();
}

class _JPlattaViewState extends State<JPlattaView> {
  @override
  Widget build(BuildContext contextk) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('jPlatta'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Container(height: 10),
              const Text(
                'Product number: P002',
                style: TextStyle(fontSize: 17),
              ),
              Container(height: 10),
              const Text(
                'Product price: 5700 kr',
                style: TextStyle(fontSize: 17),
              ),
              Container(height: 20),
              //  const Text(
              //    'Total stock jPlatta:  ',
              //    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              //  ),
              Container(height: 20),
              const Text(
                ('Warehouses'),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Divider(
                thickness: 2,
                color: Colors.teal,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: widget._firestore
                      .collection('Stock_test')
                      .where('prodNr', isEqualTo: 'P002')
                      .snapshots(),
                  builder: (BuildContext context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text('Loading...');
                    }
                    return buildList(snapshot.requireData);
                  },
                ),
              ),
            ])));
  }
}

Widget buildList(QuerySnapshot snapshot) {
  return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final doc = snapshot.docs[
            index]; //för att kunna kalla på olika delar från ett doc, exempelvis doc['name']

        //Lista på produkter med prduktstad och produktlager
        return Card(
            child: ListTile(
                key: Key(doc.id),
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(
                  Icons.warehouse_sharp,
                  size: 30,
                ),
                title: Text(doc['prodCity'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                subtitle: const Text('Tap to edit stock'),
                trailing: Text(
                  'Quantity: ' + doc['prodQuant'].toString(),
                  style: const TextStyle(fontSize: 15),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JPlattaEdit(
                          id: doc.id,
                          prodCity: doc['prodCity'],
                          prodName: doc['prodName'],
                          prodQuant: doc['prodQuant'],
                        ),
                      ));
                }));
      });
}
