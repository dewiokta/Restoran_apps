import 'package:flutter/material.dart';
import 'package:restaurant/restaurant.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text('Restaurants'),
        ),
        body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            final List<Restaurant> restaurant = parseRestaurants(snapshot.data);
            return ListView.builder(
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                return Container(
                    child: Column(children: [
                  _restaurantItem(context, restaurant[index])
                ]));
              },
            );
          },
        ));
  }
}

Widget _restaurantItem(BuildContext context, Restaurant resto) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Hero(
      tag: resto.pictureId,
      child: Image.network(
        resto.pictureId,
        width: 100,
      ),
    ),
    subtitle: Column(
      children: [
        Row(
          children: [
            Text(resto.city),
          ],
        ),
        Row(
          children: [
            Text(resto.rating.toString()),
          ],
        ),
      ],
    ),
  );
}
