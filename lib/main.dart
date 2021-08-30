import 'package:flutter/material.dart';
import 'package:restaurant/detailMenu.dart';
import 'package:restaurant/restaurant.dart';
import 'detailMenu.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Home(),
      routes: {
        _HomeState.routeName: (context) => Home(),
        DetailMenu.routeName: (context) => DetailMenu(
              resto: ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      }));
}

class Home extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const routeName = '/home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('D Restaurants'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurants(snapshot.data);
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                return Container(
                    child: Column(children: [
                  _restaurantItem(context, restaurant[index])
                ]));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
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
            Text(
              resto.name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
    onTap: () {
      Navigator.pushNamed(context, DetailMenu.routeName, arguments: resto);
    },
  );
}
