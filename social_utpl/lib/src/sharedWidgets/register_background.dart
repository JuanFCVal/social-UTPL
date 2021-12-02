import 'package:flutter/material.dart';

class RegisterBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(child: _bubble(), top: 0, left: 20),
        Positioned(child: _bubble(), top: 50, right: 20),
        Positioned(child: _bubble(), top: 150, left: 120),
        Positioned(child: _bubble(), top: 250, right: 100),
        Positioned(child: _bubble(), top: 350, right: 20),
        Positioned(child: _bubble(), top: 450, left: 20),
        Positioned(child: _bubble(), top: 250, left: 20),
        Positioned(child: _bubble(), top: 550, right: 50),
      ],
    );
  }

  _bubble() {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(28, 49, 68, 0.05),
      ),
    );
  }
}
