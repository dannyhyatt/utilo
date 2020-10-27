import 'package:flutter/material.dart';
import 'package:utilo/qr_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('utilo'),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          )
        )
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _tile(
                text: "QR Scanner",
                icon: Icons.all_out,
                backgroundColor: Colors.pink,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => QRScannerPage()));
                }
            ),
            _tile(
                text: "QR Maker",
                icon: Icons.all_out,
                backgroundColor: Colors.blue,
                onPressed: (){}
            ),
            _tile(
                text: "Ruler",
                icon: Icons.straighten,
                backgroundColor: Colors.red,
                onPressed: (){}
            ),
            _tile(
                text: "Sensor Data",
                icon: Icons.location_searching,
                backgroundColor: Colors.orange,
                onPressed: (){}
            ),
          ],
        )
      ),
    );
  }
}

Widget _tile({String text, IconData icon, Color backgroundColor, VoidCallback onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: FlatButton(
      padding: EdgeInsets.zero,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox.expand(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon, size: 96, color: Colors.white),
              Text(text, style: TextStyle(color: Colors.white), textScaleFactor: 1.2,)
            ],
          ),
        ),
      ),
      onPressed: onPressed,
    ),
  );
}