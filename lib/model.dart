/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StockItem {
  String id;
  String product;
  String city;
  int quantity;

  StockItem(
      {required this.id,
      required this.product,
      required this.city,
      required this.quantity});

  Map<String, dynamic> createMap() {
    return {'id': id, 'product': product, 'city': city, 'quantity': quantity};
  }

  StockItem.fromIdAndJson(Map<String, dynamic> parsedJSON)
      : id = parsedJSON['id'],
        product = parsedJSON['product'],
        city = parsedJSON['city'],
        quantity = parsedJSON['quantity'];
}

class StockState extends ChangeNotifier {
  final List<StockItem> _list = [];

  List<StockItem> get list => _list;

  Stream<List<StockItem>> getStock() {
    return FirebaseFirestore.instance
        .collection('Stock')
        .snapshots()
        .map((snapShot) => snapShot.docs.map((document) {
              print(document);
              return StockItem.fromIdAndJson(document.data());
            }).toList());
  }

  Future<void> updateStock(StockItem stock) {
    return FirebaseFirestore.instance
        .collection('Stock')
        .doc(stock.id)
        .update({'quantity': stock.quantity})
        .then((value) => print('Stock updated'))
        .catchError((error) => print('Failed to update task: $error'));
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

