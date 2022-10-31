import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Merhaba Patron"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const <Widget>[
              Text("Resim 22221"),
              Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
              Text("Resim2"),
              Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}
