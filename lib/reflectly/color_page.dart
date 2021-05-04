import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myflutterdashboard/reflectly/custom_scroll_physics.dart';

Color kPurple = Color(0xff536dfe);
Color kOrange = Color(0xffffbcaf);
Color kPink = Color(0xffec457a);
Color kGreen = Color(0xff69f0ae);
Color kBlue = Color(0xff1e88e5);
Color kBlueGreen = Color(0xff64ffda);

primaryColor() {}

class ColorPage extends StatefulWidget {
  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage>
    with SingleTickerProviderStateMixin {
  Color primaryColor = kPurple;
  ScrollController scrollController = ScrollController();
  double radius = 50;
  int pressedIndex = 0;
  Animation<Offset> upperSlide;
  Animation<Offset> lowerSlide;
  Animation<Offset> dummySlide;

  Animation<double> position;
  Animation<double> dummyPosition;
  AnimationController controller;
  int middleIndex = 1;

  setColor(Color color) {
    if (color != primaryColor) {
      // scrollController.jumpTo(scrollController.offset + 80);
      setState(() {
        primaryColor = color;
      });
    }
  }

  setIndex(index) {
    setState(() {
      pressedIndex = index;
    });
  }

  onPressReleased() {
    setState(() {
      pressedIndex = 0;
    });
  }

  scrollListener() {
    double viewport = scrollController.position.viewportDimension;
    double division = viewport / 3;
    double offset = scrollController.offset;
    double max = scrollController.position.maxScrollExtent;
    double scrollLimit = (MediaQuery.of(context).size.width) / 3;

    // print('pixel is ${scrollController.position.pixels}');
    // print('offset is ${scrollController.position.}');

    setState(() {
      middleIndex = (scrollController.offset / scrollLimit).round() + 1;
    });

    print('middle index is $middleIndex');

    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      // scrollController.animateTo(
      //   offset - size,
      //   duration: Duration(milliseconds: 1),
      //   curve: Curves.ease,
      // );
      // setState(() {
      //   middleIndex--;
      // });
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      // scrollController.createScrollPosition(
      //     AlwaysScrollableScrollPhysics(),
      //     ScrollableState(),
      //     ScrollPositionWithSingleContext(
      //       physics: AlwaysScrollableScrollPhysics(),
      //       context: ScrollableState(),
      //     ));
      // scrollController.animateTo(
      //   offset + size,
      //   duration: Duration(milliseconds: 1),
      //   curve: Curves.ease,
      // );
      // setState(() {
      //   middleIndex++;
      // });
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    upperSlide =
        Tween(begin: Offset(0.0, -0.1), end: Offset.zero).animate(controller);
    lowerSlide = Tween(
      begin: Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(controller);

    dummySlide = Tween(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(controller);

    dummyPosition = Tween(
      begin: 1.0,
      end: 1.0,
    ).animate(controller);

    position = Tween(
      begin: 1.2,
      end: 1.0,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    print('.........${middleIndex > 3}');
    print(MediaQuery.of(context).size.width);
    double sizedWidth = (MediaQuery.of(context).size.width - (65 * 3)) / 3 / 2;
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Boom - magic color change!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'CAN BE CHANGED LATER IN SETTINGS',
              style: TextStyle(
                color: Color(0x66000000),
                fontSize: 15.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Flexible(
            child: ListView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: CustomScrollPhysics(),
              children: [
                SizedBox(width: sizedWidth),
                ColorContainer(
                  scaleFactor: middleIndex == 1 ? position : dummyPosition,
                  slideFactor: middleIndex > 1
                      ? lowerSlide
                      : middleIndex < 1
                          ? upperSlide
                          : dummySlide,
                  isTransparent: true,
                ),
                SizedBox(width: sizedWidth * 2),
                ColorContainer(
                  scaleFactor: middleIndex == 1 ? position : dummyPosition,
                  slideFactor: middleIndex > 1
                      ? lowerSlide
                      : middleIndex < 1
                          ? upperSlide
                          : dummySlide,
                  color: kPurple,
                  onPressed: setColor,
                  index: 1,
                  size: pressedIndex == 1 ? 100 : 80,
                  onLongpress: setIndex,
                  onEnd: onPressReleased,
                ),
                SizedBox(width: sizedWidth * 2),
                ColorContainer(
                  scaleFactor: middleIndex == 2 ? position : dummyPosition,
                  slideFactor: middleIndex > 2
                      ? lowerSlide
                      : middleIndex < 2
                          ? upperSlide
                          : dummySlide,
                  color: kOrange,
                  onPressed: setColor,
                  index: 2,
                  size: pressedIndex == 2 ? 100 : 80,
                  onLongpress: setIndex,
                  onEnd: onPressReleased,
                ),
                SizedBox(width: sizedWidth * 2),
                ColorContainer(
                  scaleFactor: middleIndex == 3 ? position : dummyPosition,
                  slideFactor: middleIndex > 3
                      ? lowerSlide
                      : middleIndex < 3
                          ? upperSlide
                          : dummySlide,
                  color: kPink,
                  onPressed: setColor,
                  index: 3,
                  size: pressedIndex == 3 ? 100 : 80,
                  onLongpress: setIndex,
                  onEnd: onPressReleased,
                ),
                SizedBox(width: sizedWidth * 2),
                ColorContainer(
                  scaleFactor: middleIndex == 4 ? position : dummyPosition,
                  slideFactor: middleIndex > 4
                      ? lowerSlide
                      : middleIndex < 4
                          ? upperSlide
                          : dummySlide,
                  color: kGreen,
                  onPressed: setColor,
                  index: 4,
                  size: pressedIndex == 4 ? 100 : 80,
                  onLongpress: setIndex,
                  onEnd: onPressReleased,
                ),
                SizedBox(width: sizedWidth * 2),
                ColorContainer(
                  scaleFactor: middleIndex == 5 ? position : dummyPosition,
                  slideFactor: middleIndex > 5
                      ? lowerSlide
                      : middleIndex < 5
                          ? upperSlide
                          : dummySlide,
                  color: kBlue,
                  onPressed: setColor,
                  index: 5,
                  size: pressedIndex == 5 ? 100 : 80,
                  onLongpress: setIndex,
                  onEnd: onPressReleased,
                ),
                SizedBox(width: sizedWidth * 2),
                ColorContainer(
                  scaleFactor: middleIndex == 6 ? position : dummyPosition,
                  slideFactor: middleIndex > 6
                      ? lowerSlide
                      : middleIndex < 6
                          ? upperSlide
                          : dummySlide,
                  color: kBlueGreen,
                  onPressed: setColor,
                  index: 6,
                  size: pressedIndex == 6 ? 100 : 80,
                  onLongpress: setIndex,
                  onEnd: onPressReleased,
                ),
                SizedBox(width: sizedWidth * 2),
                ColorContainer(
                  scaleFactor: middleIndex == 1 ? position : dummyPosition,
                  slideFactor: middleIndex > 1
                      ? lowerSlide
                      : middleIndex < 1
                          ? upperSlide
                          : dummySlide,
                  color: Colors.black,
                  isTransparent: true,
                ),
                SizedBox(width: sizedWidth),
              ],
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            color: Colors.white,
            child: Text(
              'NEXT',
              style: TextStyle(
                color: primaryColor,
                fontSize: 18,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class FaceLogo extends StatelessWidget {
  const FaceLogo({
    Key key,
    this.size = 70,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            spreadRadius: -7,
            blurRadius: 3,
            color: Color(0x77000000),
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Image.asset('assets/face.gif'),
    );
  }
}

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    this.color,
    this.onPressed,
    this.size = 50,
    this.onLongpress,
    this.onEnd,
    this.index,
    this.isTransparent = false,
    this.slideFactor,
    this.scaleFactor,
    Key key,
  }) : super(key: key);

  final Color color;
  final Function(Color color) onPressed;
  final double size;
  final Function(int index) onLongpress;
  final Function onEnd;
  final int index;
  final bool isTransparent;
  final Animation<Offset> slideFactor;
  final Animation<double> scaleFactor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SlideTransition(
        position: slideFactor,
        child: ScaleTransition(
          scale: scaleFactor,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: 65,
            width: 65,
            decoration: ShapeDecoration(
              color: isTransparent ? Colors.transparent : color,
              shape: CircleBorder(
                  side: BorderSide(
                color: isTransparent ? Colors.transparent : Colors.white,
                width: 3,
              )),
            ),
          ),
        ),
      ),
      onTap: () {
        if (!isTransparent) onPressed(color);
      },
      onLongPress: () => onLongpress(index),
      onLongPressEnd: (d) => onEnd(),
    );
  }
}
