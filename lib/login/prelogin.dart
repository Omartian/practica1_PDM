import 'package:flutter/material.dart';

class Prelogin extends StatelessWidget {
  const Prelogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 150),
                  child: Image.asset('assets/images/cupping.png'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    child: Text(
                      "REGISTRATE",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    color: Color(0xFFBCB0A1),
                    height: 50,
                    minWidth: 350,
                    onPressed: () {})
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    child: Text(
                      "INGRESA",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    color: Color(0xFFBCB0A1),
                    height: 50,
                    minWidth: 350,
                    onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
