import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_utpl/UIStyles/buttons.dart';
import 'package:social_utpl/UIStyles/input_decoration.dart';
import 'package:social_utpl/src/models/user_model.dart';
import 'package:social_utpl/src/providers/user_provider.dart';
import 'package:social_utpl/src/sharedWidgets/auth_background.dart';
import 'package:social_utpl/src/sharedWidgets/utilities.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          AuthBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: card(context),
              ),
            ],
          ),
        ],
      )),
    );
  }

  SizedBox card(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: _LoginForm(),
              )),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController _userController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final userProvider = Provider.of<UserProvider>(context);
    UserModel tempUser = UserModel();
    return Column(
      children: [
        Text("Iniciar sesión",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).secondaryHeaderColor)),
        const SizedBox(height: 30),
        Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: _userController,
                onChanged: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Ingrese el usuario");
                  }
                },
                decoration: InputDecorations.inputDecoration(
                  context: context,
                  labelText: "Usuario",
                  icon: Icons.person,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Ingrese la contraseña");
                  }
                },
                decoration: InputDecorations.inputDecoration(
                  context: context,
                  labelText: "Contraseña",
                  hintText: "*******",
                  icon: Icons.lock,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonsDecoration.buttonStyle(
                    context: context, elevation: 3),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Iniciar sesión"),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    tempUser.usuario = _userController.text;
                    tempUser.contrasena = _passwordController.text;
                    if (await _login(tempUser, userProvider)) {
                      Navigator.pushNamed(context, 'home');
                    } else {
                      Utilities.showGenericAlert(context, "Alerta",
                          "Usuario o contraseña incorrectos", true);
                    }
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'register');
                },
                child: Text("Registrarse"),
              )
            ]))
      ],
    );
  }

  Future<bool> _login(UserModel tempUser, UserProvider userProvider) async {
    print(tempUser.usuario);
    print(tempUser.contrasena);
    final UserModel user = await userProvider.login(tempUser);
    if (user.idcuenta != null) {
      return true;
    } else {
      return false;
    }
  }
}
