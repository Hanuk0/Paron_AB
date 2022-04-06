import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paron_ab/model.dart';
import 'model.dart';

class JTelefonEdit extends StatefulWidget {
  JTelefonEdit(
      {Key? key,
      required this.id,
      required this.prodName,
      required this.prodCity,
      this.prodQuant})
      : super(key: key);

  late String id;
  String prodName;
  String prodCity;
  dynamic prodQuant;

  @override
  State<JTelefonEdit> createState() => _JTelefonEditState();
}

class _JTelefonEditState extends State<JTelefonEdit> {
//variabler att använda för att beräkna nytt lagersaldo
  var num1 = 0, num2 = 0, sum = 0;

//texteditingcontroller för textfältet
  final TextEditingController jTelefonController = TextEditingController();

  //INLEVERANS JTELEFON
  void _addJTelefonQuantity(StockItem stock) async {
    var collection = FirebaseFirestore.instance
        .collection('Stock_test')
        .doc('jTelefonNorrköping')
        .collection('Stock_test')
        .doc('jTelefonFrankfurt')
        .collection('Stock_test')
        .doc('jTelefonCupertino');

    var docSnapshot = await collection.get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedquantity = data['prodQuant'];

      setState(() {
        num1 = int.parse(jTelefonController.text);
        num2 = jtelefonsavedquantity;
        sum = num1 + num2;
      });
      _updateJTelefonQuantity(StockItem(
          id: stock.id,
          prodCity: stock.prodCity,
          prodName: stock.prodName,
          prodQuant: stock.prodQuant));
      jTelefonController.clearComposing();
    }
  }

  //UTLEVERANS JTELEFON
  void _subtractJTelefonQuantity(StockItem stock) async {
    var collection = FirebaseFirestore.instance.collection('Stock_test');
    var docSnapshot = await collection.doc('jTelefonNorrköping').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedquantity = data['prodQuant'];

      setState(() {
        num1 = int.parse(jTelefonController.text);
        num2 = jtelefonsavedquantity;
        sum = num2 - num1;
      });
      _updateJTelefonQuantity(StockItem(
          id: stock.id,
          prodCity: stock.prodCity,
          prodName: stock.prodName,
          prodQuant: stock.prodQuant));
      jTelefonController.clearComposing();
    }
  }

  //UPPDATERA LAGERSALDO
  void _updateJTelefonQuantity(StockItem stock) {
    final jTelefonQuantity = sum;

    FirebaseFirestore.instance
        .collection('Stock_test')
        .doc('jTelefonNorrköping')
        .update({'prodQuant': jTelefonQuantity})
        .then((value) => print('Product updated'))
        .catchError((error) => print('Failed to update product: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Edit stock'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(height: 30),
              Text(
                (widget.prodCity),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(height: 30),
              Text('Current stock: ' + widget.prodQuant.toString(),
                  style: const TextStyle(fontSize: 18)),
              Container(height: 30),
              editJTelefonField(),
              Container(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _addJTelefonQuantity(StockItem(
                          id: widget.id,
                          prodCity: widget.prodCity,
                          prodName: widget.prodName,
                          prodQuant: widget.prodQuant));
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Add  + ',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _subtractJTelefonQuantity(StockItem(
                          id: widget.id,
                          prodCity: widget.prodCity,
                          prodName: widget.prodName,
                          prodQuant: widget.prodQuant));
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Remove  - ',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ],
              ),
            ])));
  }

  Widget editJTelefonField() {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: jTelefonController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: 'Enter quantity you want to add or remove',
        ),
      ),
    );
  }
}
