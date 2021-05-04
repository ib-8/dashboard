import 'package:flutter/material.dart';
import 'package:myflutterdashboard/reflectly/color_page.dart';
import 'package:myflutterdashboard/reflectly/intro_page.dart';

class Reflectly extends StatefulWidget {
  @override
  _ReflectlyState createState() => _ReflectlyState();
}

class _ReflectlyState extends State<Reflectly>
    with SingleTickerProviderStateMixin {
  Animation<double> faceSize;
  Animation<double> hiThereOpacity;
  Animation<double> reflectlyOpacity;
  Animation<double> desOpacity;
  Animation<double> buttonSize;
  Animation<double> alreadySize;
  Animation<Offset> hiThereSlide;
  Animation<Offset> reflectlySlide;

  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    faceSize = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 1.3,
        ),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 1.0,
        ),
        weight: 30,
      ),
    ]).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.25),
    ));

    hiThereOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.35, 0.50),
    ));

    hiThereSlide = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.35, 0.50),
    ));
    reflectlyOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.50, 0.65),
    ));
    reflectlySlide = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.50, 0.65),
    ));

    desOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.65, 0.75),
    ));

    buttonSize = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 1.3,
        ),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 1.0,
        ),
        weight: 30,
      ),
    ]).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.75, 0.85),
    ));

    alreadySize = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 1.3,
        ),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 1.0,
        ),
        weight: 30,
      ),
    ]).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.85, 0.95),
    ));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 5, child: SizedBox()),
            Flexible(flex: 5, child: SizedBox()),
            Hero(
                tag: 'face',
                child: ScaleTransition(
                    scale: faceSize, child: FaceLogo(size: 70))),
            Column(
              children: [
                SlideTransition(
                  position: hiThereSlide,
                  child: FadeTransition(
                    opacity: hiThereOpacity,
                    child: Text(
                      'Hi there,',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: reflectlySlide,
                  child: FadeTransition(
                    opacity: reflectlyOpacity,
                    child: Text(
                      "I'm Perfectly",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FadeTransition(
              opacity: desOpacity,
              child: Text(
                "Your new personal\nself-care companion",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0x55ffffff),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(child: SizedBox()),
            Flexible(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ScaleTransition(
                scale: buttonSize,
                child: MaterialButton(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  color: Colors.white,
                  child: Text(
                    'HI, REFLECTLY!',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            ScaleTransition(
              scale: alreadySize,
              child: Text(
                " I ALREADY HAVE AN ACCOUNT",
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0x88ffffff),
                  fontWeight: FontWeight.w600,
                  // letterSpacing: 1.8,
                ),
              ),
            ),
            Flexible(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
