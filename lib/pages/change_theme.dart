import 'package:flutter/material.dart';
import 'package:persist_theme/persist_theme.dart';
import 'package:provider/provider.dart';

class ChangeTheme extends StatefulWidget {
  @override
  _ChangeThemeState createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Customize the theme", style: TextStyle(fontFamily: 'Pacifico', fontSize: 22.0),),),
      body: ListView(
        children: MediaQuery.of(context).size.width >= 480
            ? <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Flexible(child: DarkModeSwitch()),
              Flexible(child: TrueBlackSwitch()),
            ],
          ),
          CustomThemeSwitch(),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Flexible(child: PrimaryColorPicker()),
              Flexible(child: AccentColorPicker()),
            ],
          ),
          DarkAccentColorPicker(),
        ]
            : <Widget>[
          DarkModeSwitch(),
          TrueBlackSwitch(),
          CustomThemeSwitch(),
          PrimaryColorPicker(),
          AccentColorPicker(),
          DarkAccentColorPicker(),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: _theme.accentColor,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
    );
  }
}











