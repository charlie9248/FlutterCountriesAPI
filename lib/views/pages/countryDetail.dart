import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';

//TODO: complete this page - you may choose to change it to a stateful widget if necessary
class CountryDetailPage extends StatefulWidget {
  @override
  _CountryDetailPageState createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  Map parsedData = {};
  String language;
  List<String> strArr = [];
  int count =0;


  String getLanguages() {
    parsedData['languages'].forEach((element) => {
      if(element['name'] != null){
        language = element['name'],
        count++
      }});

    print(strArr);
    return language;
  }


  @override
  Widget build(BuildContext context) {
    parsedData = ModalRoute
        .of(context)
        .settings
        .arguments;
    print(parsedData);


    return Scaffold(
        appBar: AppBar(
          title: Text(parsedData['name']),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Row(
                                  children: <Widget>[

                                    CircleAvatar(
                                      child: Text(parsedData['alphacode'],
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Text(parsedData['name'], style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),),


                                  ],
                                ),
                              ),

                              SvgPicture.network(parsedData['flag']),
                              Text(parsedData['name'] + ' ' +
                                  'is a country on the ' + ' ' +
                                  parsedData['subregion'] + ' ' +
                                  'of the African continent, marked by several distinct ecosystems' +
                                  ' ' + 'with population of' + ' ' +
                                  parsedData['population'].toString()),

                            ],
                          )),
                      SizedBox(height: 15.0,),
                      Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.add_location),
                              SizedBox(width: 10.0,),
                              Column(
                                children: <Widget>[
                                  Text('Sub-Region', style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(height: 10.0,),
                                  Text(parsedData['subregion'])
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Divider(
                            height: 10.0,
                            color: Colors.grey[900],
                          ),

                          Row(
                            children: <Widget>[
                              Icon(Icons.account_balance_outlined),
                              SizedBox(width: 10.0,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: <Widget>[
                                  Text('Capital', style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(height: 10.0,),
                                  Text(parsedData['capital']),
                                ],
                              )

                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Divider(
                            height: 10.0,
                            color: Colors.grey[900],
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            child: Icon(Icons.adjust_sharp),
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 120.0, 0.0),
                            color: Colors.green,
                          ),
                          Container(
                            child: Text(getLanguages()),
                          )


                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}