import 'package:flutter/material.dart';
import 'package:p01network/networks-helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NetworkHelper nh = NetworkHelper();
  String message = "Welcome";

  @override
  void initState() {
    nh.getResponseStatus().whenComplete(() {
      setState(() {

      });
    });
    super.initState();
  }

  Widget getDisplayWidget(nhStatus) {
    if (nhStatus == Status.completed)
      return Text(nh.responseStatusCode);
    else if (nhStatus == Status.inProgress) return CircularProgressIndicator();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network Request"),
      ),
      body: Center(
        child: nh.userRequestedStatus
            ? getDisplayWidget(nh.status)
            : Text("Welcome"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (nh.userRequestedStatus==false || nh.status==Status.completed)?() {
          nh.userRequestedStatus = true;
          setState(() {

          });
        }:null,
        tooltip: 'Fetch Data',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
