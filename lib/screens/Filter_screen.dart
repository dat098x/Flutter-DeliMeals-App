import 'package:delimeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const route = '/filter';
  final Function saveFilters;
  final Map<String, bool> currentFilter;
  FilterScreen(this.saveFilters, this.currentFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lastoseFree = false;


  Widget _buildSwitchListTitle(String title, subtitle, bool value, Function onChanged) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged,
    );
  }
  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _lastoseFree = widget.currentFilter['lastose'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: [
          IconButton(icon: Icon(Icons.save),
              onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lastose': _lastoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan
                  };

                  widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal seelction',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle("Gluten-free", 'Only include gluten-free meal', _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }
                ),
                _buildSwitchListTitle("Latose-free", 'Only include latose-free meal', _lastoseFree,
                        (newValue) {
                      setState(() {
                        _lastoseFree = newValue;
                      });
                    }
                ),
                _buildSwitchListTitle("Vegetarian", 'Only include vegetarian meal', _vegetarian,
                        (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }
                ),
                _buildSwitchListTitle("Vegan", 'Only include vegan meal', _vegan,
                        (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
