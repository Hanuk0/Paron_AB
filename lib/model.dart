

/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StockItem {
  String id;
  String prodName;
  String prodCity;
  dynamic prodQuant;

  StockItem(
      {required this.id,
      required this.prodName,
      required this.prodCity,
      required this.prodQuant});

  Map<String, dynamic> createMap() {
    return {
      'id': id,
      'prodName': prodName,
      'prodCity': prodCity,
      'prodQuant': prodQuant
    };
  }

  StockItem.fromIdAndJson(Map<String, dynamic> parsedJSON)
      : id = parsedJSON['id'],
        prodName = parsedJSON['prodName'],
        prodCity = parsedJSON['prodCity'],
        prodQuant = parsedJSON['prodQuant'];
}

class StockState extends ChangeNotifier {
  final List<StockItem> _list = [];

  List<StockItem> get list => _list;

  Stream<List<StockItem>> getStock() {
    return FirebaseFirestore.instance
        .collection('Stock_test')
        .snapshots()
        .map((snapShot) => snapShot.docs.map((document) {
              print(document);
              return StockItem.fromIdAndJson(document.data());
            }).toList());
  }

  */

  /* Future<void> updateStock(StockItem stock) {
    return FirebaseFirestore.instance
        .collection('Stock')
        .doc(stock.id)
        .update({'quantity': stock.prodQuant})
        .then((value) => print('Stock updated'))
        .catchError((error) => print('Failed to update task: $error'));
  }*/

/*
  //variabler att använda för att beräkna nytt lagersaldo
  var num1 = 0, num2 = 0, sum = 0;

//texteditingcontroller för textfältet
  final TextEditingController jTelefonController = TextEditingController();

  //INLEVERANS JTELEFON
  Future<void> _addJTelefonQuantity(StockItem stock) async {
    var collection = FirebaseFirestore.instance.collection('Stock_test');
    var docSnapshot = await collection.doc(stock.id).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedquantity = data['prodQuant'];

      num1 = int.parse(jTelefonController.text);
      num2 = jtelefonsavedquantity;
      sum = num1 + num2;

      _updateJTelefonQuantity(StockItem(
          id: stock.id,
          prodCity: stock.prodCity,
          prodName: stock.prodName,
          prodQuant: stock.prodQuant));
      jTelefonController.clearComposing();
    }
  }

  //UTLEVERANS JTELEFON
  Future<void> _subtractJTelefonQuantity(StockItem stock) async {
    var collection = FirebaseFirestore.instance.collection('Stock_test');
    var docSnapshot = await collection.doc(stock.id).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedquantity = data['prodQuant'];

      num1 = int.parse(jTelefonController.text);
      num2 = jtelefonsavedquantity;
      sum = num2 - num1;

      _updateJTelefonQuantity(StockItem(
          id: stock.id,
          prodCity: stock.prodCity,
          prodName: stock.prodName,
          prodQuant: stock.prodQuant));
      jTelefonController.clearComposing();
    }
  }

//UPPDATERA LAGERSALDO
  Future<void> _updateJTelefonQuantity(StockItem stock) async {
    final jTelefonQuantity = sum;

    FirebaseFirestore.instance
        .collection('Stock_test')
        .doc(stock.id)
        .update({'prodQuant': jTelefonQuantity})
        .then((value) => print('Product updated'))
        .catchError((error) => print('Failed to update product: $error'));
  }
}
 
*/


  /*
  ProductList({Key? key}) : super(key: key);



  void _saveProduct() {
    //final productName = _controller.text;

    FirebaseFirestore.instance.collection(
        'Products'); //lägg till update här också för att uppdatera saldo
        
        
        
   class StockState extends StatefulWidget{
  const StockState({Key? key}) : super(key: key);

  @override
  State<StockState> createState() => _StockState(); 
  
  }

  class _StockState extends State<StockState>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(

   );
  }
    
  }
        */
