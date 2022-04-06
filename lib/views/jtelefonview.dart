import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paron_ab/jtelefonedit.dart';

class JTelefonView extends StatefulWidget {
  JTelefonView({
    Key? key,
  }) : super(key: key);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  State<JTelefonView> createState() => _JTelefonViewState();
}

class _JTelefonViewState extends State<JTelefonView> {
  //variabler som används för att beräkna totalt lagersaldo
  var num1 = 0, num2 = 0, num3 = 0, sum = 0;

//funktion för att räkna ut totalt lagersaldo
  void calcTotalSumJTelefon() async {
    var collection = FirebaseFirestore.instance.collection('jTelefon');
    var docSnapshot = await collection.doc('jTelefonID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedCupertinoquantity = data['jTelefonCupertinoQuant'];
      var jtelefonsavedFrankfurtquantity = data['jTelefonFrankfurtQuant'];
      var jtelefonsavedNorrkopingquantity = data['jTelefonNorrkopingQuant'];

      if (!mounted) return; //ta bort om något knasar

      setState(() {
        num1 = jtelefonsavedNorrkopingquantity;
        num2 = jtelefonsavedCupertinoquantity;
        num3 = jtelefonsavedFrankfurtquantity;
        sum = num1 + num2 + num3;
      });
    }
  }

  @override
  Widget build(BuildContext contextk) {
    calcTotalSumJTelefon();
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
              const Text('Product number: P001'),
              Container(height: 10),
              const Text('Product price: 8900 kr'),
              Container(height: 20),
              Text(
                'Total stock jTelefon: $sum ',
                style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(height: 30),
              const Text(
                ('Warehouses'),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(height: 20),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: widget._firestore
                      .collection('Stock_test')
                      .where('prodNr', isEqualTo: 'P001')
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
              ),
              //Container(height: 20),
              //const Text('Total Stock: '),
            ])));
  }
}

class CardItem extends StatefulWidget {
  late String prodName;
  late String prodCity;
  late dynamic prodQuant;
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
                  prodName: 'jTelefon',
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
}
*/
