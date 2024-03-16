import 'package:app2/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Themespages extends StatelessWidget {
  const Themespages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          child: Text('Toggle Theme'),
        ),
      ),
    );
  }
}
