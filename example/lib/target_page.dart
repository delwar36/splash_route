import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TargetPage extends StatefulWidget {
  const TargetPage({Key? key, this.appBarColor = Colors.green})
      : super(key: key);
  final Color appBarColor;

  @override
  _TargetPageState createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColor,
        title: const Text('Target page'),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: const Center(
        child: Text('Second Page'),
      ),
    );
  }
}
