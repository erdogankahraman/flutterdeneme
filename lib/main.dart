import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  FirstRoute({super.key});

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.red,
    minimumSize: const Size(188, 50),
    elevation: 18,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Merhaba Patron"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const Text(
                  "Resim 22221",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                const Image(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: TextButton(
                    style: flatButtonStyle,
                    child: Text(
                      'Button 2',
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "This is a Toast message", // message
                        toastLength: Toast.LENGTH_SHORT, // length
                        gravity: ToastGravity.CENTER, // location// duration
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondRoute()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
