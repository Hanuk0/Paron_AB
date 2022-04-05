import 'package:flutter/material.dart';

class JTelefonEdit extends StatefulWidget {
  const JTelefonEdit(
      {Key? key,
      required this.prodName,
      required this.prodCity,
      this.prodQuant})
      : super(key: key);

  final String prodName;
  final String prodCity;
  final dynamic prodQuant;

  @override
  State<JTelefonEdit> createState() => _JTelefonEditState();
}

class _JTelefonEditState extends State<JTelefonEdit> {
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
                    onPressed: () {},
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
                    onPressed: () {},
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
}

Widget editJTelefonField() {
  return Container(
    margin: const EdgeInsets.all(1),
    padding: const EdgeInsets.all(10),
    child: TextField(
      // controller: jTelefonController,
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
