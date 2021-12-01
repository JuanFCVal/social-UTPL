import 'package:flutter/material.dart';

class Utilities {
  static showGenericAlert(
      BuildContext context, String title, String body, bool dismisable) {
    return showDialog(
        context: context,
        barrierDismissible: dismisable, //Se cierra la alerta clickando afuera
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize
                  .min, //La columna se adaptara al tamaño del contenido no a toda la pantalla
              children: [
                Text(body),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
            ],
          );
        });
  }
}
