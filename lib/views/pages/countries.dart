import 'package:countries_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

// TODO: fetch list of countries from API and render
// Feel free to change this to a stateful widget if necessary
class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  List listCountries;
  var convertToJSon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries();
  }

  Future<String> getCountries() async {
    var response = await http.get(
        'https://restcountries.eu/rest/v2/region/africa',
        headers: {"Accept": "Application/json"});
    print(response.body);

    setState(() {
      convertToJSon = jsonDecode(response.body);
      listCountries = convertToJSon;
    });

    print(convertToJSon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Countries"),
          actions: [
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.about)),
          ],
        ),
        body: ListView.builder(
            itemCount: listCountries == null ? 0 : listCountries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () => {
                            print(listCountries[index]['name'] + '$index'),
                            Navigator.pushNamed(
                                context, AppRoutes.countryDetail,
                                arguments: {
                                  'languages': listCountries[index]['languages'],
                                  'alphacode': listCountries[index]['alpha2Code'],
                                  'name': listCountries[index]['name'],
                                  'flag': listCountries[index]['flag'],
                                  'capital': listCountries[index]
                                  ['capital'],
                                  'population': listCountries[index]
                                  ['population'],
                                  'subregion': listCountries[index]
                                  ['subregion'],
                                }),
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Container(
                                  child: SvgPicture.network(
                                      listCountries[index]['flag'] != null
                                          ? listCountries[index]['flag']
                                          : listCountries[0]['flag'],
                                      width: 30.0,
                                      height: 30.0),
                                  padding: EdgeInsets.all(16.0),
                                ),
                                SizedBox(width: 5.0,),
                                Container(
                                    child: Text(listCountries[index]['name'])
                                )],
                            ),
                          )),
                    ],
                  ),
                ),
              );
            }));
  }
}
