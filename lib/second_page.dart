
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class SecondPage extends StatelessWidget{
  static const routeName = '/second_page';
  const SecondPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    SecondPageArguments arguments = ModalRoute.of(context)!.settings.arguments as SecondPageArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda pantalla"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Text(arguments.name),
              Text(arguments.lastName),
            ]
          ),
        ),
    );
  }
}

class SecondPageArguments{
  String name;
  String lastName;
  String email;
  SecondPageArguments({required this.name,required this.lastName,required this.email});
}