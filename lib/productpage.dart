import 'package:flutter/material.dart';
import 'views/jtelefonview.dart';
import 'views/jplattaview.dart';
import 'views/paronklockaview.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Päron AB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 30),
            const Text(
              ('Products'),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => jTelefonView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  title: Text('jTelefon'),
                  // subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            ),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JPlattaView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  title: Text('jPlatta'),
                  //   subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            ),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ParonKlockaView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  title: Text('Päronklocka'),
                  //  subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


/* KANSKE VILL BEHÅLLA

Widget _jTelefon(context) {
  return ListTile(
    leading: Icon(
      Icons.note_alt_sharp,
      size: 30,
      color: Colors.green.shade800,
    ),
    //   onTap: () => Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => DescriptionView(task))),
    title: Text('jTelefon'),
    subtitle: Text('quantity'),
    trailing: IconButton(
      icon: const Icon(Icons.chevron_right),
      onPressed: () {},
    ),
  );
}

Widget _jPlatta(context) {
  return ListTile(
    leading: Icon(
      Icons.note_alt_sharp,
      size: 30,
      color: Colors.green.shade800,
    ),
    //   onTap: () => Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => DescriptionView(task))),
    title: Text('jPlatta'),
    subtitle: Text('quantity'),
    trailing: IconButton(
      icon: const Icon(Icons.chevron_right),
      onPressed: () {},
    ),
  );
}

Widget _päronKlocka(context) {
  return ListTile(
    leading: Icon(
      Icons.note_alt_sharp,
      size: 30,
      color: Colors.green.shade800,
    ),
    //   onTap: () => Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => DescriptionView(task))),
    title: Text('Päronklocka'),
    subtitle: Text('quantity'),
    trailing: IconButton(
      icon: const Icon(Icons.chevron_right),
      onPressed: () {},
    ),
  );
}
*/

/* class ProductPage extends StatefulWidget {
  final stock;
  const ProductPage(this.stock, {Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() {
    return ProductPageState(stock);
  }
} 


class ProductPageState extends State<ProductPage> {
  final stock;
  ProductPageState(this.stock); */
