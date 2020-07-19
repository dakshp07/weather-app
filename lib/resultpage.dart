import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultPage extends StatefulWidget {

  String city;
  ResultPage({this.city});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  Map weatherData;
  fetchData() async {
    http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q="+widget.city+"&appid=e01cc9f18367170be0955715002f0658");
    setState(() {
      weatherData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Today's Weather",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: weatherData == null ? new Center(
        child: new CircularProgressIndicator(),
      ) : new Container(
        padding: const EdgeInsets.all(60),
        child: new Column(
          children: <Widget>[
            new Text(weatherData["name"],style: TextStyle(fontSize: 45,color: Colors.white,fontWeight: FontWeight.bold),),
            new Image.network("http://openweathermap.org/img/wn/"+weatherData["weather"][0]["icon"]+"@4x.png",),
            new Text((weatherData["main"]["temp"] - 273.15).toStringAsFixed(2)+"℃",style: TextStyle(fontSize: 45,color: Colors.white,fontWeight: FontWeight.bold),),
            new Padding(padding: const EdgeInsets.only(bottom: 30)),
            new Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text("Feels Like:",style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                      new Text((weatherData["main"]["feels_like"] - 273.15).toStringAsFixed(2)+"℃",style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 5)),
                  new Row(
                    children: <Widget>[
                      new Text("Max:",style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                      new Text((weatherData["main"]["temp_max"] - 273.15).toStringAsFixed(2)+"℃",style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 5)),
                  new Row(
                    children: <Widget>[
                      new Text("Min:",style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                      new Text((weatherData["main"]["temp_min"] - 273.15).toStringAsFixed(2)+"℃",style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 5)),
                  new Row(
                    children: <Widget>[
                      new Text("Humidity:",style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                      new Text((weatherData["main"]["humidity"]).toString()+"%",style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 40)),
                  new RaisedButton(
                    child:
                    new Row(
                      children: <Widget>[
                        new Icon(Icons.arrow_back,size: 20,color: Colors.white,),
                        new Text(" CHANGE CITY",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    color: Colors.green[600],
                    padding: const EdgeInsets.all(5),
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
