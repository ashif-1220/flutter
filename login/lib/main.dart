

import 'package:flutter/material.dart';

void main()=>runApp(new myApp());

class myApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
class LoginPage extends StatefulWidget{
  @override
  State createState()=> new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  late AnimationController _iconAnimationController;
  late Animation <double> _iconAnimation;
  @override
  
  void initState() {
    super.initState();
    _iconAnimationController= new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500),
      );
      _iconAnimation=new CurvedAnimation(
        parent: _iconAnimationController,
         curve:Curves.bounceOut,
         );
         _iconAnimation.addListener(()=>this.setState(() {}));
         _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor:Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children:<Widget> [
          new Image(image:new AssetImage("assets/girl.jpeg"),
          fit:BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
          ),
      new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlutterLogo(
            size: _iconAnimation.value*100,
          ),
          new Form(child: Theme(
            data: new ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.teal,
              inputDecorationTheme: new InputDecorationTheme(
                labelStyle: new TextStyle()
              )
            ),
            child: new Column(
              children:<Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Enter Email,"
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                   new Form(child: new Column(
              children:<Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Enter Password,"
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              ],
            ),
          
            )
                  ],
                ),
          ),
        ],
      ),
       
    );
  }
}