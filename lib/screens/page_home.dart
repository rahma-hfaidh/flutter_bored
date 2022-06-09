import 'package:bored_app/models/citation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'add_provider.dart';
import 'favories_citations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.all(20),
          child: Image.asset(
            'assets/boring_face.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          )),
      Container(
        color: Gray,
        height: 700,
        child: Expanded(
          child: Title(
              color: Colors.black,
              child: Text("snapshot.data[index].description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
        ),
      ),
      Row(children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.close,
            color: Red,
          ),
          onPressed: () {
            setState(() {});
          },
        ),
        IconButton(
          icon: Icon(
            Icons.star,
            color: Blue,
          ),
          onPressed: () {
            context.read<CitProvider>().addProduit(Citation(1," Theres no place like home"));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListCitations()),
              //Navigator.of(context).pop();
            );

          },
        ),
        IconButton(
          icon: Icon(Icons.favorite, color: Green),
          onPressed: () {
            setState(() {

            });
          },
        ),
      ])
    ]);
  }
}
