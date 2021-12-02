import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:social_utpl/src/models/publication.dart';
import 'package:social_utpl/src/models/user_model.dart';
import 'dart:convert';

class PublicationProvider extends ChangeNotifier {
  PublicationProvider() {
    debugPrint('PublicationProvider initiaded');
    getAllPublications();
  }
  bool _isLoading = false;
  List<Publication> _publications = [];
  final String api = "http://localhost:3000";
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  List<Publication> get GetPublications => _publications;

  getAllPublications() async {
    try {
      final url = Uri.parse(api + '/allpublications');
      int flag = 0;
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      print(decodedData['data'][0].length);
      for (var i = 0; i < decodedData['data'][0].length; i++) {
        Publication publicationTemp = Publication.fromJson(
            decodedData['data'][0][i]['publicacion']['infopublicacion']);
        UserModel userTemp = UserModel.fromJson(
            decodedData['data'][0][i]['publicacion']['estudiante']);
        publicationTemp.estudiante = userTemp;
        _publications.add(publicationTemp);
        notifyListeners();
      }
      print(_publications.length);
    } catch (e) {
      debugPrint("Huno un error");
    }
  }
}
