import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paron_ab/edit/jtelefonedit.dart';

class JTelefonView extends StatefulWidget {
  JTelefonView({
    Key? key,
  }) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  State<JTelefonView> createState() => _JTelefonViewState();
}

class _JTelefonViewState extends State<JTelefonView> {
  @override
  Widget build(BuildContext contextk) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('jTelefon'),
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
                'Product number: P001',
                style: TextStyle(fontSize: 17),
              ),
              Container(height: 10),
              const Text(
                'Product price: 8900 kr',
                style: TextStyle(fontSize: 17),
              ),
              Container(height: 20),
              //   const Text(
              //     'Total stock jTelefon:  ',
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              //   ),
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
                      .where('prodNr', isEqualTo: 'P001')
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
            index]; //för att kunna kalla på olika delar från ett doc, exempelvis doc['prodName']

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
                        builder: (context) => JTelefonEdit(
                          id: doc.id,
                          prodCity: doc['prodCity'],
                          prodName: doc['prodName'],
                          prodQuant: doc['prodQuant'],
                        ),
                      ));
                }));
      });
}
