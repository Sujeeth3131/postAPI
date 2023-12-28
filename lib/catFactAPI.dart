import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model/catfact.dart';

class CatFactAPI extends StatefulWidget {
  const CatFactAPI({super.key});

  @override
  State<CatFactAPI> createState() => _CatFactAPIState();
}

class _CatFactAPIState extends State<CatFactAPI> {

  Future<CatFact> FetchCatDetails() async{
    var resp = await http.get(Uri.parse("https://catfact.ninja/fact"));
    return CatFact.fromJson(jsonDecode(resp.body));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //FetchCatDetails();
  }


  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<CatFact>(
            future: FetchCatDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.fact.toString()),
                    Text(snapshot.data!.length.toString())
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
