import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  getALLUserd() async{
    var response =await http.get('htp://genesis.iecsemanipal.com/getAllusers');
    print(response.body);
  }
  List temp = new List.generate(
      10,
      (index) => ListTile(
            title: Text('$index'),
          ));

  @override
  Widget build(BuildContext context) {
    getALLUserd();
    return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/371633/pexels-photo-371633.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),fit: BoxFit.fitHeight)
              ),
              child: Center(
                child: CircleAvatar(radius: 75.0,backgroundImage:NetworkImage('https://www.shutterbug.com/images/styles/600_wide/public/Beginner-Photography-Mistakes-Peter-McKinnon_0.jpg') ,
                ),
              ),
            ),
            GridView.count(
              primary: false,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: List.generate(27, (index)=>Container(
                padding: EdgeInsets.all(8.0),
                child:
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      child: Image.network('https://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2018/09/Phibsoo-Wildlife-Sanctuary-cover.jpg', fit : BoxFit.cover)
                    );
                  },
                
                child: Image.network('https://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2018/09/Phibsoo-Wildlife-Sanctuary-cover.jpg', fit : BoxFit.cover),
                ),
              ),
              ),
            )
        
    ]));
  }
}