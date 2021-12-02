import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_utpl/src/models/user_model.dart';
import 'package:social_utpl/src/providers/publications_provider.dart';
import 'package:social_utpl/src/sharedWidgets/publication_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final publicationProvider = Provider.of<PublicationProvider>(context);
    final UserModel usuario =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Muro'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
            )
          ],
        ),
        body: SizedBox.expand(
          child: publicationProvider.GetPublications.length == 0
              ? Center(child: CircularProgressIndicator())
              : ListaPublication(
                  publicationProvider.GetPublications,
                ),
        )
        // _underConstruction(usuario),
        );
  }
}
