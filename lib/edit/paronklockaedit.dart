import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParonKlockaEdit extends StatefulWidget {
  ParonKlockaEdit(
      {Key? key,
      required this.id,
      required this.prodName,
      required this.prodCity,
      this.prodQuant})
      : super(key: key);

  String id;
  String prodName;
  String prodCity;
  dynamic prodQuant;

  @override
  State<ParonKlockaEdit> createState() => _ParonKlockaEditState();
}

class _ParonKlockaEditState extends State<ParonKlockaEdit> {
//variabler att använda för att beräkna nytt lagersaldo
  var num1 = 0, num2 = 0, sum = 0;

//controller som tar in vad användaren fyller i i textfältet
  final TextEditingController paronKlockaController = TextEditingController();

  // Inleverans
  void _addParonklockaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('Stock_test');

    var docSnapshot = await collection.doc(widget.id).get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var paronKlockasavedquantity = data['prodQuant'];

      setState(() {
        num1 = int.parse(paronKlockaController.text);
        num2 = paronKlockasavedquantity;
        sum = num1 + num2;
      });
      _updateParonKlockaQuantity();
      paronKlockaController.clearComposing();
    }
  }

  // Utleverans
  void _removeParonKlockaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('Stock_test');
    var docSnapshot = await collection.doc(widget.id).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var paronKlockasavedquantity = data['prodQuant'];

      setState(() {
        num1 = int.parse(paronKlockaController.text);
        num2 = paronKlockasavedquantity;
        sum = num2 - num1;
      });
      _updateParonKlockaQuantity();
      paronKlockaController.clearComposing();
    }
  }

  //Funktion för uppdatering av lagersaldo
  void _updateParonKlockaQuantity() {
    final paronKlockaQuantity = sum;

    FirebaseFirestore.instance
        .collection('Stock_test')
        .doc(widget.id)
        .update({'prodQuant': paronKlockaQuantity})
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
                widget.prodName + ' ' + (widget.prodCity),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(height: 30),
              Text('Current stock: ' + widget.prodQuant.toString(),
                  style: const TextStyle(fontSize: 18)),
              Container(height: 30),
              editJPlattaField(),
              Container(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _addParonklockaQuantity();
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
                      _removeParonKlockaQuantity();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Remove  - ',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        fixedSize: const Size(160, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ],
              ),
            ])));
  }

  Widget editJPlattaField() {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: paronKlockaController,
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
