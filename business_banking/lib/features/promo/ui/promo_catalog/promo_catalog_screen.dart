import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class PromoCatalogScreen extends Screen {
  //TODO: implement vm below and pass in constructor
  //final PromoCatalogViewModel? viewModel;

  PromoCatalogScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Checking Account Promotions'),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Card(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 20.0),
                child: Center(
                  child: Image.network(
                      'https://www.huntington.com/-/media/hcom/BackgroundImages/white-green-hex-outlines.jpg'),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 20.0),
                    child: Center(
                        child:
                            Text('Promotions for you', style: TextStyle(fontSize: 24))),
                  ),
                  Divider(),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView(
                      children: <Widget>[
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                leading: Icon(Icons.ac_unit),
                                title: Text('Money For Free!'),
                                subtitle: Text('Only tomorrow!'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
