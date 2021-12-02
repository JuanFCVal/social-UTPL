import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_utpl/src/models/publication.dart';
import 'package:social_utpl/src/screens/construction.dart';

class ListaPublication extends StatelessWidget {
  final List<Publication> publicaciones;
  const ListaPublication(this.publicaciones);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: ListView.builder(
        itemCount: publicaciones.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new UnderConstruction()));
              },
              child: _Publicacion(publicaciones[index], index));
        },
      ),
    );
  }
}

class _Publicacion extends StatelessWidget {
  final Publication publication;
  final int index;
  const _Publicacion(
    this.publication,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TarjetaTitulo(publication),
          TopBar(publication, index),
          publication.img != null
              ? Center(child: _TarjetaImagen(publication))
              : SizedBox(
                  height: 5,
                ),
          _TarjetaBody(publication),
          SizedBox(
            height: 10,
          ),
          _TarjetaBotones(),
          Divider(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RawMaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.comment,
            color: Colors.black,
            size: 25,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        RawMaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.share,
            color: Colors.black,
            size: 25,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        )
      ],
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Publication publication;
  _TarjetaBody(this.publication);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(publication.descripcion ?? ""),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Publication publication;
  const _TarjetaImagen(this.publication);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          height: 200,
          child: (publication.img != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/resources/giphy.gif'),
                  image: NetworkImage(publication.img!))
              : const Image(image: AssetImage('assets/resources/no-image.png')),
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Publication publication;
  _TarjetaTitulo(this.publication);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        publication.titulo ?? "",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  final Publication publication;
  final int index;
  const TopBar(
    this.publication,
    this.index,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${publication.estudiante?.nombre ?? ""}',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Text(
              ' ${publication.estudiante?.apellido ?? ""}',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
