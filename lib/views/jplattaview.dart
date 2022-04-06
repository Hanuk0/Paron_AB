import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JPlattaView extends StatefulWidget {
  JPlattaView({Key? key}) : super(key: key);

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  State<JPlattaView> createState() => _JPlattaViewState();
}

class _JPlattaViewState extends State<JPlattaView> {
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
              .doc('jPlatta')
              .collection('jPlatta1')
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
        contentPadding: const EdgeInsets.all(16),
        leading: const Icon(Icons.warehouse_sharp),
        title: Text(widget.prodCity),
        subtitle: const Text('Edit stock'),
        trailing: Text('Quantity ' + widget.prodQuant.toString()),
      ),
    );
  }
}
