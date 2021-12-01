import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_utpl/src/providers/user_provider.dart';
import 'package:social_utpl/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery',
        initialRoute: 'login',
        routes: getApplicationRoutes(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[250],
          primaryColor: Color.fromRGBO(9, 71, 121, 1),
          secondaryHeaderColor: Color.fromRGBO(28, 49, 68, 1),
        ),
      ),
    );
  }
}
