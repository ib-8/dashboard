import 'package:flutter/material.dart';

class CustomScrollPhysics extends ScrollPhysics {
  /// Creates physics for a [PageView].
  const CustomScrollPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  double _getPage(ScrollMetrics position) {
    return position.pixels / position.viewportDimension;
  }

  double _getPixels(ScrollMetrics position, double page) {
    // print('page is $page');
    // print('pixel is ${position.pixels}');
    return page.roundToDouble() * (position.viewportDimension);
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = position.pixels / position.viewportDimension * 3;
    // if (velocity < -tolerance.velocity) {
    //   // print('velocity is lesser');

    //   page -= 0.5;
    // } else if (velocity > tolerance.velocity) {
    //   // print('velocity is greater');
    //   page += 0.5;
    // }
    // print('pixels is ${position.pixels}');
    // print('page is $page');
    // print('dime is ${position.viewportDimension}');

    return (page.roundToDouble()) * (position.viewportDimension / 3);
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // print('position is $position');

    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    // print('simulating target: $target  ');

    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
