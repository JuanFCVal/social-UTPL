import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AuthBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Stack(
            children: [
              _UpSide(),
              Positioned(
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Container(height: 150, width: 100, child: topLogo()),
                        SizedBox(width: 20),
                        Text(
                          "Social UTPL",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget topLogo() {
    return Image.asset(
      'assets/resources/logo.png',
    );
  }
}

class _UpSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: _boxDecoration(),
      child: Stack(
        children: [
          Positioned(child: _bubble(), top: 0, left: 0),
          Positioned(child: _bubble(), top: 100, left: 100),
          Positioned(child: _bubble(), top: 0, right: 0),
          Positioned(child: _bubble(), top: 200, left: 200),
          Positioned(child: _bubble(), top: 50, left: 170),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(0, 63, 114, 1),
          Color.fromRGBO(9, 71, 121, 1),
        ],
      ),
    );
  }

  _bubble() {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
