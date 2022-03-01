import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class displayApp extends StatelessWidget {
  String date,about,tittle;



  displayApp({required this.date,required this.about,required this.tittle});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black//change your color here
        ),
        backgroundColor: Colors.white,
        title: Text('${tittle}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.grey),),
      ),
      backgroundColor: Colors.indigo,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('${date}',style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: '${about}',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),


    );
  }
}
