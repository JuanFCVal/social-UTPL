import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_utpl/UIStyles/buttons.dart';
import 'package:social_utpl/UIStyles/input_decoration.dart';
import 'package:social_utpl/src/models/career.dart';
import 'package:social_utpl/src/models/user_model.dart';
import 'package:social_utpl/src/providers/user_provider.dart';
import 'package:social_utpl/src/sharedWidgets/register_background.dart';

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
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _nameInput(nameController: _nameController),
                            const SizedBox(height: 20.0),
                            _lastnameInput(
                                lastnameController: _lastnameController),
                            const SizedBox(height: 20.0),
                            _userInput(usernameController: _usernameController),
                            const SizedBox(height: 20.0),
                            _emailInput(emailController: _emailController),
                            const SizedBox(height: 20.0),
                            _passwordInput(
                                passwordController: _passwordController),
                            _careerInput(
                                carreraSelected: carreraSelected,
                                careerController: _careerController),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Selecciona tu carrera",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // DropdownButton<String>(
                            //   items:
                            //       userProvider.carreras.getNames().map((String items) {
                            //     return DropdownMenuItem(
                            //       value: items,
                            //       child: Text(items),
                            //     );
                            //   }).toList(),
                            // ),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                itemCount: userProvider.carreras.items.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      carreraSelected =
                                          userProvider.carreras.items[index];
                                      _careerController.text = userProvider
                                          .carreras.items[index].nombre!;
                                    },
                                    child: Text(
                                      userProvider
                                              .carreras.items[index].nombre ??
                                          "",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushReplacementNamed(context, 'login');
                      } else if (!result) {
                        final snackBar = SnackBar(
                            content: Text(
                                'No se ha podido registrar, usuario o email ya registrado'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _careerInput extends StatelessWidget {
  const _careerInput({
    Key? key,
    required this.carreraSelected,
    required TextEditingController careerController,
  })  : _careerController = careerController,
        super(key: key);

  final Carrera carreraSelected;
  final TextEditingController _careerController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}

class _passwordInput extends StatelessWidget {
  const _passwordInput({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}

class _emailInput extends StatelessWidget {
  const _emailInput({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}

class _userInput extends StatelessWidget {
  const _userInput({
    Key? key,
    required TextEditingController usernameController,
  })  : _usernameController = usernameController,
        super(key: key);

  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}

class _lastnameInput extends StatelessWidget {
  const _lastnameInput({
    Key? key,
    required TextEditingController lastnameController,
  })  : _lastnameController = lastnameController,
        super(key: key);

  final TextEditingController _lastnameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}

class _nameInput extends StatelessWidget {
  const _nameInput({
    Key? key,
    required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
