import 'dart:html';

import 'package:flutter/material.dart';

import 'second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ingreso de Datos',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: MyHomePage(title: 'Ingreso de Datos'),
        routes: {
        SecondPage.routeName: (context) =>
        const SecondPage(),
  },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
  late TextEditingController nameTextController;
  late TextEditingController lastNameTextController;
  late TextEditingController emailTextController;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(children: <Widget> [
            TextField(
              decoration: InputDecoration(labelText: "Nombre: "),
              controller: nameTextController,),
            TextField(
              decoration: InputDecoration(labelText: "Apellido: "),
              controller: lastNameTextController,),
            TextField(
              decoration: InputDecoration(labelText: "Email: "),
              controller: emailTextController,
            ),
            RaisedButton(
              child: Text("Mostrar Datos"),
              onPressed: () {
                _showSecondPage(context);
              }
              )
        ],),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showSecondPage(BuildContext context){
    Navigator.pushNamed(
      context,
      SecondPage.routeName,
      arguments: SecondPageArguments(
        name: nameTextController.text,
        lastName:lastNameTextController.text,
        email:emailTextController.text)
    );
  }

  @override
  void initState(){
    super.initState();
    nameTextController = TextEditingController();
    lastNameTextController = TextEditingController();
    emailTextController = TextEditingController();
  }

  @override
  void dispose(){
    super.dispose();
    nameTextController.dispose();
    lastNameTextController.dispose();
    emailTextController.dispose();
  }
}





