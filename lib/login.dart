import 'package:flutter/material.dart';
import 'package:paron_ab/productpage.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Päron AB'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              _logo(),
              Container(height: 24),
              const Text(
                'Päron AB Logistic',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 72,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductPage()));
                },
                child: const Text('Log In'),
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    fixedSize: const Size(220, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ])));
  }

  Widget _logo() {
    return Stack(
      children: [
        const Image(image: AssetImage('assets/transparent_pear_2.png')),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 20,
          ),
        ),
      ],
    );
  }
}
