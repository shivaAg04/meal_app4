import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' The Filters!'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'It is not working yet ,kuch din me chlne lgega',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                    title: Text(' Gluten - free'),
                    subtitle: Text(' only include gluten - free meals'),
                    value: _glutenFree,
                    onChanged: (newvalue) {
                      setState(() {
                        _glutenFree = newvalue;
                      });
                    }),
                SwitchListTile(
                    title: Text('vegetarian'),
                    subtitle: Text(' only include vegetarian meals'),
                    value: _vegetarian,
                    onChanged: (newvalue) {
                      setState(() {
                        _vegetarian = newvalue;
                      });
                    }),
                SwitchListTile(
                    title: Text('vegan'),
                    subtitle: Text(' only include  vegan meals'),
                    value: _vegan,
                    onChanged: (newvalue) {
                      setState(() {
                        _vegan = newvalue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Lactose - free'),
                    subtitle: Text(' only include  Lactose- free meals'),
                    value: _lactoseFree,
                    onChanged: (newvalue) {
                      setState(() {
                        _lactoseFree = newvalue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
