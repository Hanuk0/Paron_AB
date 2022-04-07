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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JTelefonView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  contentPadding: EdgeInsets.all(11),
                  title: Text('jTelefon',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  subtitle: Text('Tap to see more info and edit'),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 40,
                    color: Colors.teal,
                  ),
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
                  contentPadding: EdgeInsets.all(11),
                  title: Text('jPlatta',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  subtitle: Text('Tap to see more info and edit'),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 40,
                    color: Colors.teal,
                  ),
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
                  contentPadding: EdgeInsets.all(11),
                  title: Text('Päronklocka',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  subtitle: Text('Tap to see more info and edit'),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 40,
                    color: Colors.teal,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
