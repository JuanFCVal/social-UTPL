import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_utpl/UIStyles/buttons.dart';
import 'package:social_utpl/UIStyles/input_decoration.dart';
import 'package:social_utpl/src/models/career.dart';
import 'package:social_utpl/src/models/user_model.dart';
import 'package:social_utpl/src/providers/user_provider.dart';
import 'package:social_utpl/src/sharedWidgets/register_background.dart';
import 'package:social_utpl/src/sharedWidgets/utilities.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _lastnameController = TextEditingController();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _careerController = TextEditingController();
    final userProvider = Provider.of<UserProvider>(context);
    Carrera carreraSelected = Carrera();
    UserModel tempUser = UserModel();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Crear una cuenta'),
      ),
      body: Stack(
        children: [
          RegisterBackground(),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Ingrese el nombre");
                        }
                      },
                      decoration: InputDecorations.inputDecoration(
                        context: context,
                        labelText: "Nombre",
                        icon: Icons.person_add,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _lastnameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Ingrese el apellido");
                        }
                      },
                      decoration: InputDecorations.inputDecoration(
                        context: context,
                        labelText: "Apellido",
                        icon: Icons.person_add,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Ingrese el usuario");
                        }
                      },
                      controller: _usernameController,
                      decoration: InputDecorations.inputDecoration(
                        context: context,
                        labelText: "Usuario",
                        icon: Icons.person,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return ("Ingrese el email");
                        }
                        if (!emailValid) {
                          return ("Ingrese un email válido");
                        }
                      },
                      controller: _emailController,
                      decoration: InputDecorations.inputDecoration(
                        context: context,
                        labelText: "Email",
                        icon: Icons.email,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Ingrese la contraseña ");
                        }
                      },
                      controller: _passwordController,
                      decoration: InputDecorations.inputDecoration(
                        context: context,
                        labelText: "Contraseña",
                        icon: Icons.lock,
                      ),
                    ),
                    TextFormField(
                      enabled: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Seleccione una carrera");
                        }
                        if (carreraSelected == null) {
                          return ("Seleccione una carrera");
                        }
                      },
                      controller: _careerController,
                      decoration: InputDecorations.inputDecoration(
                        context: context,
                        labelText: "Carrera",
                        icon: Icons.settings_accessibility_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        itemCount: userProvider.carreras.items.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              carreraSelected =
                                  userProvider.carreras.items[index];
                              _careerController.text =
                                  userProvider.carreras.items[index].nombre!;
                            },
                            child: Text(
                              userProvider.carreras.items[index].nombre ?? "",
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ButtonsDecoration.buttonStyle(
                          context: context, elevation: 3),
                      child: const Text('Crear cuenta'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          tempUser.nombre = _nameController.text;
                          tempUser.apellido = _lastnameController.text;
                          tempUser.email = _emailController.text;
                          tempUser.usuario = _usernameController.text;
                          tempUser.contrasena = _passwordController.text;
                          final bool result = await userProvider.createUser(
                              tempUser, carreraSelected);
                          if (result) {
                            final snackBar = SnackBar(
                                content: Text(
                                    'Usuario registrado correctamente, inicie sesión'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.pushReplacementNamed(context, 'login');
                          } else if (!result) {
                            final snackBar = SnackBar(
                                content: Text(
                                    'No se ha podido registrar, usuario o email ya registrado'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
