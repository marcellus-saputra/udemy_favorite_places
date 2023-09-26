import 'package:flutter/material.dart';
import 'package:udemy_favorite_places/models/place.dart';

class YourPlaces extends StatefulWidget {
  const YourPlaces({super.key});

  @override
  State<YourPlaces> createState() => _YourPlacesState();
}

class _YourPlacesState extends State<YourPlaces> {
  List<Place> _places = [
    const Place(id: '0', name: 'Nesnorium'),
    const Place(id: '1', name: 'Vilingstone'),
  ];

  Widget getPlacesList() {
    return ListView.builder(
      itemCount: _places.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          onDismissed: (direction) {
            _places.removeWhere((element) => element.id == _places[index].id);
          },
          key: ValueKey(_places[index].id),
          child: ListTile(
            title: Text(_places[index].name),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: getPlacesList(),
      ),
    );
  }
}
