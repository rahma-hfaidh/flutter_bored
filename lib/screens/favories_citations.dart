import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/citation.dart';
import 'add_provider.dart';

class ListCitations extends StatefulWidget {
  const ListCitations({Key? key}) : super(key: key);

  @override
  _ListCitationsState createState() => _ListCitationsState();
}

class _ListCitationsState extends State<ListCitations> {
  List<Citation> ListC = [];
   Future<List<Citation>> getAll() async
  {


    ListC.clear();
    var response = await http.get("http://10.0.2.2:5001/citaions/GetCitation}");



    if(response.statusCode == 200)
    {
      ListC.clear();
    }
    var decodedData = jsonDecode(response.body);
    for (var u in decodedData)
    {

      ListC.add(Citation(u['id_citation'],u['description']));

    }

    return ListC;
  }


  @override
  Widget build(BuildContext context) {
    // getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("citations"),
      ),
      body: getCitationsList(),
    );
  }

  /*
  Widget cit() {
    return Container(

        child: Consumer<CitProvider>(
            builder: (BuildContext context, value, Widget child) {
              return Stack(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.citations.length,
                        itemBuilder: (BuildContext context, int index) {
                          CitProvider cit = value.citations[index];
                        }),
                  ]

              )


            }
        )
    );
  }
  */
  Widget getCitationsList() {
    return FutureBuilder(
        //future: getAll(),

        builder: (context, AsyncSnapshot<List<Citation>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      resizeToAvoidBottomInset:
      false;
      return GridView.builder(
        itemCount: snapshot.data?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemBuilder: (context, index) => InkWell(
          child: Card(
            child: Column(
              children: [
                Expanded(
                    child: Title(
                        color: Colors.black,
                        child: Text(
                            "Have a paper airplane contest with some friends",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)))),
              ],
            ),
          ),
        ),
      );
    });
  }
}
