import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'resultpage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController t1 = new TextEditingController(text: "");

  void clear(){
    t1.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Weather App",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new Container(
        padding: const EdgeInsets.all(30),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                labelText: "Enter The Name Of City",
                labelStyle: TextStyle(fontSize: 20,color: Colors.green[600],fontWeight: FontWeight.bold),
              ),
              controller: t1,
              keyboardType: TextInputType.text,
            ),
            new Padding(padding: const EdgeInsets.only(top: 20)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                    child:
                    new Text("SUBMIT",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ResultPage(city: t1.text,)));
                    },
                  color: Colors.green[600],
                  padding: const EdgeInsets.all(10),
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                new RaisedButton(
                  child:
                  new Text("CLEAR",style: TextStyle(fontSize: 20,color: Colors.green[600],fontWeight: FontWeight.bold),),
                  onPressed: clear,
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
