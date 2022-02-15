library splash_route;

import 'package:flutter/material.dart';

Widget _defaultTransitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return child;
}

class SplashRoute<T> extends PageRoute<T> {
  /// Creates a route that delegates to builder callbacks.
  ///
  /// The [targetPage], [transitionsBuilder], [opaque], [barrierDismissible],
  /// [maintainState], and [fullscreenDialog] arguments must not be null.
  SplashRoute({
    RouteSettings? settings,
    required this.targetPage,
    this.splashColor = Colors.green,
    this.startFractionalOffset = FractionalOffset.center,
    this.transitionsBuilder = _defaultTransitionsBuilder,
    this.transitionDuration = const Duration(milliseconds: 1500),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
    this.opaque = false,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    bool fullscreenDialog = false,
  }) : super(settings: settings, fullscreenDialog: fullscreenDialog);

  /// Used build the route's primary contents.
  ///
  /// See [ModalRoute.buildPage] for complete definition of the parameters.
  /// {@endtemplate}
  final Widget targetPage;

  /// {@template flutter.widgets.pageRouteBuilder.transitionsBuilder}
  /// Used to build the route's transitions.
  ///
  /// See [ModalRoute.buildTransitions] for complete definition of the parameters.
  /// {@endtemplate}
  final RouteTransitionsBuilder transitionsBuilder;
  final FractionalOffset startFractionalOffset;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  final Color splashColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constrains) {
          return TweenAnimationBuilder(
            duration: transitionDuration,
            tween: Tween(begin: 0.0, end: 1.0),
            child: targetPage,
            builder: (context, double value, child) {
              return ShaderMask(
                shaderCallback: (rect) {
                  return RadialGradient(
                    center: startFractionalOffset,
                    radius: value * 5,
                    colors: [
                      Colors.white,
                      Colors.white,
                      splashColor,
                      Colors.transparent,
                    ],
                    stops: const [0, 0.55, 0.60, 1.0],
                  ).createShader(rect);
                },
                child: child,
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return transitionsBuilder(context, animation, secondaryAnimation, child);
  }
}
