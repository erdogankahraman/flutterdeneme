import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'cameraExampleHome.dart';
import 'geoLocation.dart';
import 'harita.dart';

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

List<CameraDescription> cameras = <CameraDescription>[];

var resimURL =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Seal_of_the_Turkish_Navy.svg/1200px-Seal_of_the_Turkish_Navy.svg.png";
var textTitle = "Deniz Kuvvetleri Komutanlığı";

void main() async {
  // Ensure that plugin services are initialized so that `availableCameras()` can be called before `runApp()`
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    print(cameras);
  } on CameraException catch (e) {
    print(e.toString());
  }
  runApp(MaterialApp(
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  FirstRoute({super.key});

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
                SwitchExample(),
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
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: TextButton(
                    style: flatButtonStyle,
                    child: Text(
                      'Button 3',
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
                        MaterialPageRoute(builder: (context) => ThirdRoute()),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: TextButton(
                    style: flatButtonStyle,
                    child: Text(
                      'Button Konum',
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
                        MaterialPageRoute(builder: (context) => MapExample()),
                      );
                    },
                  ),
                ),
                Container(
                  height: 100,
                  color: Color.fromARGB(100, 200, 200, 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: flatButtonStyle,
                        child: Text(
                          'Haritayı Aç',
                          style: TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HaritaExample()),
                          );
                        },
                      ),
                      Icon(Icons.map),
                    ],

                  ),
                )
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
          child: Column(children: <Widget>[
            const Text('Go back!'),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                style: flatButtonStyle,
                child: Text(
                  'Button 3',
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
                    MaterialPageRoute(builder: (context) => ThirdRoute()),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ThirdRoute> {
  List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter - tutorialkart.com')),
      ),
      body: ListView(children: <Widget>[
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: ToggleButtons(
              children: <Widget>[
                Icon(Icons.add_comment),
                Icon(Icons.airline_seat_individual_suite),
                Icon(Icons.add_location),
              ],
              isSelected: _selections,
              onPressed: (int index) {
                setState(() {
                  _selections[index] = !_selections[index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraApp()),
                  );
                });
              },
            ))
      ]),
    ));
  }
}

class CameraApp extends StatelessWidget {
  /// Default Constructor
  const CameraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CameraExampleHome(),
    );
  }
}

class MapExample extends StatelessWidget {
  /// Default Constructor
  const MapExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GeolocatorWidget(),
    );
  }
}

class HaritaExample extends StatelessWidget {
  /// Default Constructor
  const HaritaExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text(
        textTitle,
        style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      ),
      Image(
        width: 300,
        height: 300,
        image: NetworkImage(resimURL),
      ),
      Switch(
        // This bool value toggles the switch.
        value: light,
        activeColor: Colors.red,
        onChanged: (bool value) {
          // This is called when the user toggles the switch.
          setState(() {
            light = value;
            if (!light) {
              resimURL =
                  "https://upload.wikimedia.org/wikipedia/tr/9/95/Seal_of_the_Turkish_Armed_Forces.png";
              textTitle = "Kara Kuvvetleri Komutanlığı";
            } else {
              resimURL =
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Seal_of_the_Turkish_Navy.svg/1200px-Seal_of_the_Turkish_Navy.svg.png";
              textTitle = "Deniz Kuvvetleri Komutanlığı";
            }
          });
        },
      )
    ]));
  }
}
