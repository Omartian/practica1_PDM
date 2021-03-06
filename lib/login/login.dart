import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/login/register.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Image.asset('assets/images/cupping.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 5),
            child: Row(
              children: [Text("Nombre completo: ")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 350,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 350,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    child: Text(
                      "ENTRAR",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    color: Color(0xFFBCB0A1),
                    height: 50,
                    minWidth: 350,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Home(title: APP_TITLE);
                      }));
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 64),
            child: Text(
              "¿Olvidaste tu password?",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 64, 8, 8),
            child: InkWell(
              child: Text(
                "¿Aún no tienes una cuenta?",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Register();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
