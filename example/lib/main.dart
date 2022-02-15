import 'package:example/target_page.dart';
import 'package:flutter/material.dart';
import 'package:splash_route/splash_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Ruote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Splash Ruote'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _goToNextPage(
    BuildContext context,
    FractionalOffset position,
    Color splashColor,
    Duration duration,
  ) {
    Navigator.of(context).push(
      SplashRoute(
        targetPage: TargetPage(
          appBarColor: splashColor,
        ),
        splashColor: splashColor,
        startFractionalOffset: position,
        transitionDuration: duration,
      ),
    );
  }

  _goNextButton(
    BuildContext context,
    FractionalOffset position,
    Color splashColor,
    Duration duration,
  ) {
    return InkWell(
      onTap: () => _goToNextPage(
        context,
        position,
        splashColor,
        duration,
      ),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: splashColor,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: _goNextButton(
              context,
              FractionalOffset.center,
              Colors.blue,
              const Duration(
                milliseconds: 2000,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: _goNextButton(
              context,
              FractionalOffset.bottomRight,
              const Color.fromARGB(255, 121, 71, 6),
              const Duration(
                milliseconds: 1500,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: _goNextButton(
              context,
              FractionalOffset.bottomLeft,
              Colors.orange,
              const Duration(
                milliseconds: 1500,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: _goNextButton(
              context,
              const FractionalOffset(0.9, 0.2),
              Colors.red,
              const Duration(
                milliseconds: 1500,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: _goNextButton(
              context,
              const FractionalOffset(0.1, 0.2),
              Colors.purple,
              const Duration(
                milliseconds: 1500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
