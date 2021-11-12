import 'package:flutter/material.dart';
import 'dart:core';

class Funct extends StatefulWidget {
  const Funct({Key? key}) : super(key: key);

  @override
  _FunctState createState() => _FunctState();
}

class _FunctState extends State<Funct> {
  TextEditingController txt = TextEditingController();
  var getText = "";
  var data = [];
  add() {
    setState(() {
      data.add(getText);
      print(data);
    });
  }

  update() {
    setState(() {
      if (data.isEmpty == false) {
        data.removeLast();
      }
      ;
      data.add(getText);
      print(data);
    });
  }

  delete() {
    setState(() {
      print(data.removeLast());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.36,
            ),
            Container(
              color: Colors.blueGrey[200],
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: txt,
                onChanged: (value) {
                  getText = value;
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      add();
                      txt.clear();
                    },
                    child: Text("Add")),
                ElevatedButton(
                    onPressed: () {
                      update();
                      txt.clear();
                    },
                    child: Text("Update")),
                ElevatedButton(
                    onPressed: () {
                      delete();
                      txt.clear();
                    },
                    child: Text("Delete")),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Text(data[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
