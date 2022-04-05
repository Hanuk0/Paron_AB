import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paron_ab/jtelefonedit.dart';

class JTelefonView extends StatefulWidget {
  JTelefonView({Key? key}) : super(key: key);
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  State<JTelefonView> createState() => _JTelefonViewState();
}

class _JTelefonViewState extends State<JTelefonView> {
  @override
  Widget build(BuildContext context) {
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
              const Text(
                ('Warehouses'),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(height: 20),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: widget._firestore
                      .collection('Stock1')
                      .doc('jTelefon')
                      .collection('jTelefon1')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Text('Loading...');
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          String prodName =
                              snapshot.data!.docs[index]['prodName'];
                          String prodCity =
                              snapshot.data!.docs[index]['prodCity'];
                          dynamic prodQuant =
                              snapshot.data!.docs[index]['prodQuant'];

                          return CardItem(
                              prodName: prodName,
                              prodCity: prodCity,
                              prodQuant: prodQuant);
                        });
                  },
                ),
              )
            ])));
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
        contentPadding: const EdgeInsets.all(16),
        leading: const Icon(Icons.warehouse_sharp),
        title: Text(widget.prodCity),
        subtitle: const Text('Edit stock'),
        trailing: Text('Quantity ' + widget.prodQuant.toString()),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JTelefonEdit(
                  prodCity: widget.prodCity,
                  prodName: '',
                  prodQuant: widget.prodQuant,
                ),
              ));
        },
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
