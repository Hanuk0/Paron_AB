import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class jTelefonView extends StatefulWidget {
  jTelefonView({Key? key}) : super(key: key);
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  State<jTelefonView> createState() => _jTelefonViewState();
}

class _jTelefonViewState extends State<jTelefonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('jTelefon'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: widget._firestore
              .collection('Stock1')
              .doc('jTelefon')
              .collection('jTelefon1')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Text('Loading...');
            }
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  String prodName = snapshot.data!.docs[index]['prodName'];
                  String prodCity = snapshot.data!.docs[index]['prodCity'];
                  dynamic prodQuant = snapshot.data!.docs[index]['prodQuant'];

                  return CardItem(
                      prodName: prodName,
                      prodCity: prodCity,
                      prodQuant: prodQuant);
                });
          },
        ));
  }
}

class CardItem extends StatefulWidget {
  late String prodName;
  late String prodCity;
  late dynamic prodQuant;
  //late String prodNr;
  //late dynamic prodPrice;

  CardItem(
      {Key? key,
      required this.prodName,
      required this.prodCity,
      this.prodQuant})
      : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.prodCity),
        trailing: Text('Quantity ' + widget.prodQuant.toString()),
      ),
    );
  }
}

  




        /*
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Stock').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LinearProgressIndicator();
            return _buildList(snapshot.requireData);
          },
        ));
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

            //  onTap: () => MaterialPageRoute(
            //     builder: ((context) => const ProductPage()),

            // trailing: Text(doc['price'].toString() + ' kr'),
          );
        });
  }
}*/
