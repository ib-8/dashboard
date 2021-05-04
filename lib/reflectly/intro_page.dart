import 'package:flutter/material.dart';
import 'package:myflutterdashboard/reflectly/color_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  final PageController pageController = PageController();

  Animation<Offset> logoSlide;

  Animation<Offset> arrowSlide;
  AnimationController animationController;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
      reverseDuration: Duration(milliseconds: 800),
    );

    logoSlide = Tween(begin: Offset.zero, end: Offset(0.0, -1.8))
        .animate(animationController);
    arrowSlide = Tween(begin: Offset.zero, end: Offset(-1, 0.0))
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPurple,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: SlideTransition(
                      position: arrowSlide,
                      child: GestureDetector(
                        child: Icon(
                          Icons.west,
                          color: Color(0x77ffffff),
                        ),
                        onTap: () {
                          // if (pageController.page == 0) {
                          //   Navigator.pop(context);
                          // } else {
                          // pageController.previousPage(
                          //   duration: Duration(milliseconds: 800),
                          //   curve: Curves.ease,
                          // );
                          // }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SlideTransition(
                      position: logoSlide,
                      child: Hero(
                        tag: 'face',
                        child: FaceLogo(),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            Flexible(
              child: PageView(
                controller: pageController,
                physics: BouncingScrollPhysics(),
                // pageSnapping: false,
                scrollDirection: Axis.horizontal,
                children: [
                  // NamePage(
                  //   focusNode: focusNode,
                  //   onPressed: () {
                  //     // pageController.nextPage(
                  //     //   duration: Duration(milliseconds: 800),
                  //     //   curve: Curves.ease,
                  //     // );
                  //   },
                  //   onEditingStart: () {
                  //     animationController.forward();
                  //     setState(() {});
                  //   },
                  //   onEditingStopped: () {
                  //     print('Stopped');
                  //     animationController.reverse();
                  //     focusNode.unfocus();
                  //   },
                  // ),
                  ColorPage(),
                  // Center(child: Text('Hello')),
                  // Center(child: Text('Dello')),
                  // Center(child: Text('Tello')),
                  // Center(child: Text('Gello')),
                  // Center(child: Text('Rello')),
                ],
              ),
            ),
            focusNode.hasFocus
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: Color(0x77ffffff), radius: 3),
                        SizedBox(width: 10),
                        CircleAvatar(backgroundColor: Colors.white, radius: 3),
                        SizedBox(width: 10),
                        CircleAvatar(
                            backgroundColor: Color(0x77ffffff), radius: 3),
                      ],
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: focusNode.hasFocus
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.done,
                  color: kPurple,
                  size: 35,
                ),
                onPressed: () {
                  animationController.reverse();
                  focusNode.unfocus();
                  setState(() {});
                },
              ),
            )
          : SizedBox(),
    );
  }
}
