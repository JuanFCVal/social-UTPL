import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _underConstruction(),
      ),
    );
  }

  Widget _underConstruction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¡Bienvenido! 😅',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        Text('Por aquí seguimos trabajando, vuelve pronto!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        SizedBox(height: 20),
        Image(image: AssetImage('assets/resources/working.gif')),
      ],
    );
  }
}
