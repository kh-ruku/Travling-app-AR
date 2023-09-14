import 'package:flutter/material.dart';
import 'package:travling_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {super.key, required this.saveFilters, required this.currentFilters});
  static const screenRoute = 'filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamely = false;

  @override
  void initState() {
    _isInSummer = widget.currentFilters["summer"] ?? false;
    _isInWinter = widget.currentFilters["winter"] ?? false;
    _isForFamely = widget.currentFilters["family"] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الفلترة"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                "summer": _isInSummer,
                "winter": _isInWinter,
                "family": _isForFamely,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text("الرحلات الصيفية"),
                  subtitle: Text("اظهار الرحلات في فصل الصيف فقط"),
                  value: _isInSummer,
                  onChanged: (value) {
                    setState(() {
                      _isInSummer = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("الرحلات الشتوية"),
                  subtitle: Text("اظهار الرحلات في فصل الشتاء فقط"),
                  value: _isInWinter,
                  onChanged: (value) {
                    setState(() {
                      _isInWinter = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("للعائلات فقط"),
                  subtitle: Text("اظهار الرحلات العائلية فقط"),
                  value: _isForFamely,
                  onChanged: (value) {
                    setState(() {
                      _isForFamely = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
