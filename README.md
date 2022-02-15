# Splash Route

It is a simple route with fancy animation. 

<br><br>

# Demo
<img src="https://raw.githubusercontent.com/delwar36/splash_route/master/example/splashRoute.gif" width="250" height="480"/>


# Installation

Add `splash_route: ^1.0.0` to your `pubspec.yaml` dependecies. And import it:

```
import 'package:splash_route/splash_route.dart';
```
<br>

# How to use
Simply add a `SplashRoute` as route inside a `Navigator` with required params.

```  
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
```
<br>
