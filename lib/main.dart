import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> names = <String>['Apple', 'Banana', 'Orange'];


  TextEditingController nameController = TextEditingController();

  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);

    });
  }

  getCustomAppBar(){return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.tealAccent,
            Colors.redAccent,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: (){}),
          Text('Simple List Maker', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          IconButton(icon: Icon(Icons.assignment), onPressed: (){}),
        ],),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getCustomAppBar(),
        body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add New Item Here',
                  ),
                ),
              ),
              RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  addItemToList();
                },
              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: names.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                              child: Text('${names[index]}',
                                style: TextStyle(fontSize: 18),
                              )
                          ),
                        );
                      }
                  )
              )
            ]
        )
    );
  }
}