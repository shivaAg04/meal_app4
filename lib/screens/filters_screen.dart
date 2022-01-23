import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function savefunction;
  final Map<String, bool> currentFilter;
  FiltersScreen(this.currentFilter, this.savefunction);

  @override
  _FiltersScreenState createState() => _FiltersScreenState(savefunction);
}

class _FiltersScreenState extends State<FiltersScreen> {
  final Function _savefunction;

  _FiltersScreenState(this._savefunction);

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' The Filters!'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                _savefunction(selectedFilter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
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
