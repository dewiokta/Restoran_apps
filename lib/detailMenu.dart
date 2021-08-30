import 'package:flutter/material.dart';
import 'restaurant.dart';

class DetailMenu extends StatelessWidget {
  static const routeName = '/detail_menu';

  final Restaurant resto;

  const DetailMenu({required this.resto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Restaurant',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(resto.pictureId),
              Padding(padding: EdgeInsets.all(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(resto.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                  Text(
                    resto.rating.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Text(
                resto.city,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text('Description: '),
              Padding(padding: EdgeInsets.all(3)),
              Text(resto.description),
              Padding(padding: EdgeInsets.all(8)),
              Text('Menu : '),
              Padding(padding: EdgeInsets.all(3)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: resto.menus.foods.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text('- ' + resto.menus.foods[index].name);
                        }),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: resto.menus.drinks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text('- ' + resto.menus.drinks[index].name);
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
