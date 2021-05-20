import 'package:delimeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const route = '/filter';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
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
