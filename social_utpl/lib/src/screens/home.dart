import 'package:flutter/material.dart';
import 'package:social_utpl/src/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel usuario =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Muro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido,  ${usuario.usuario}! 😅',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Text('Por aquí seguimos trabajando, vuelve pronto!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            SizedBox(height: 20),
            Image(image: AssetImage('assets/resources/working.gif')),
          ],
        ),
      ),
    );
  }
}
