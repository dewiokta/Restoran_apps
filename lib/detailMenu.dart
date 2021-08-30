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
          'Resto (Rest to Eat)',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(tag: resto.pictureId, child: Image.network(resto.pictureId)),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(resto.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                resto.city,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                resto.rating.toString(),
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Colors.green),
                  Text(
                    resto.description,
                    textAlign: TextAlign.justify,
                  ),
                  Divider(color: Colors.green),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Food',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Drink',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
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
                              return Text(
                                  '- ' + resto.menus.drinks[index].name);
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
