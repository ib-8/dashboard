import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myflutterdashboard/calc/calc.dart';
import 'package:myflutterdashboard/dummy.dart';
import 'package:myflutterdashboard/howdy/howdy.dart';
import 'package:myflutterdashboard/palindrome/home.dart';
import 'package:myflutterdashboard/reflectly/welcome_page.dart';
import 'package:myflutterdashboard/tic_tac_toe/xo.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  bool isMobileScreen = false;
  Color color = Colors.teal;
  int index = 0;
  double logoSize = 20;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        isMobileScreen = constraints.maxWidth < 600;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: isMobileScreen ? 25 : 50,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
                fontFamily: GoogleFonts.lemon().fontFamily,
              ),
            ),
            actions: [
              ActionWidget(
                actionText: 'Perfectly',
                pageController: pageController,
                index: 0,
              ),
              ActionWidget(
                actionText: 'Howdy',
                pageController: pageController,
                index: 1,
              ),
              ActionWidget(
                actionText: 'XO',
                pageController: pageController,
                index: 2,
              ),
              ActionWidget(
                actionText: 'Calc+',
                pageController: pageController,
                index: 3,
              ),
              ActionWidget(
                actionText: 'Palindrome',
                pageController: pageController,
                index: 4,
              ),
              SizedBox(width: isMobileScreen ? 10 : 50)
            ],
          ),
          body: PageView(
            pageSnapping: false,
            controller: pageController,
            onPageChanged: (ind) {
              setState(() {
                index = ind;
                switch (ind) {
                  case 0:
                    color = Colors.teal;
                    break;
                  case 1:
                    color = Colors.pink;
                    break;
                }
              });
            },
            scrollDirection: Axis.vertical,
            children: [
              MainContainer(
                leftChild: AppDemo(
                  app: Reflectly(),
                  isMobile: isMobileScreen,
                ),
                rightChild: AppDescription(
                  title: 'Perfectly',
                  tagLine: 'Reflectly clone',
                  isMobile: isMobileScreen,
                  details: [
                    '- Animating Log in screen',
                    '- Color theme',
                  ],
                ),
              ),
              MainContainer(
                  leftChild: AppDescription(
                    appScreen: Howdy(),
                    title: 'Howdy!',
                    isMobile: isMobileScreen,
                    tagLine: 'Just a WhatsApp clone',
                    details: [
                      '- Voice call and video call',
                      '- One to one chat',
                      '- Add status',
                      '- Firebase for Backend',
                      '- Agora for RTC',
                      '- Color themes'
                    ],
                    plugins: [
                      '- Firesbase Auth',
                      '- Cloud Firestore',
                      '- Firebase Storage',
                      '- Arora RTC engine',
                      '- Camera',
                      '- Video player',
                      '- Provider',
                      '- Shared preferences',
                      '- Path provider',
                      '- Permission handler',
                      '- Audio player'
                    ],
                  ),
                  rightChild: AppImages(
                    isMobile: isMobileScreen,
                  )),
              MainContainer(
                leftChild: AppDemo(
                  isMobile: isMobileScreen,
                  app: isMobileScreen ? SizedBox() : TicTacToe(),
                ),
                rightChild: AppDescription(
                  appScreen: TicTacToe(),
                  isMobile: isMobileScreen,
                  title: 'XO',
                  tagLine: 'Simple Tic Tac Toe',
                  details: ['- Game for 2 players'],
                  plugins: ['- Google Fonts'],
                ),
              ),
              MainContainer(
                rightChild: AppDemo(
                  isMobile: isMobileScreen,
                  app: isMobileScreen ? SizedBox() : Calculator(),
                ),
                leftChild: AppDescription(
                  appScreen: Calculator(),
                  isMobile: isMobileScreen,
                  title: 'Calc+',
                  tagLine: 'My first app',
                  details: ['- Calcualtor with dark mode'],
                ),
              ),
              MainContainer(
                  leftChild: AppDemo(
                    isMobile: false,
                    app: Palindrome(),
                  ),
                  rightChild: AppDescription(
                    title: 'Palindrome checker',
                    tagLine: 'Try any characters',
                    isMobile: isMobileScreen,
                    details: [
                      '- Palindrome suggestion',
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}

class ActionWidget extends StatelessWidget {
  const ActionWidget({
    Key key,
    @required this.actionText,
    @required this.pageController,
    this.index,
  }) : super(key: key);

  final String actionText;
  final PageController pageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: BlackText(actionText),
          onTap: () => pageController.jumpToPage(index),
        ),
      ),
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key key,
    this.color = Colors.white,
    this.leftChild,
    this.rightChild,
  }) : super(key: key);

  final Color color;
  final Widget leftChild;
  final Widget rightChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: BorderDirectional(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        children: [
          leftChild,
          rightChild,
        ],
      ),
    );
  }
}

class AppDemo extends StatelessWidget {
  AppDemo({
    Key key,
    this.app,
    this.isMobile,
  }) : super(key: key);

  final Widget app;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? 0 : MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.symmetric(horizontal: 185, vertical: 50),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              width: 12,
            )),
        child: app,
      ),
    );
  }
}

class AppImages extends StatefulWidget {
  AppImages({
    Key key,
    this.app,
    this.isMobile,
  }) : super(key: key);

  final Widget app;
  final bool isMobile;

  @override
  _AppImagesState createState() => _AppImagesState();
}

class _AppImagesState extends State<AppImages> {
  VideoPlayerController videoPlayerController;
  int index = 0;
  final List<String> assetsList = [
    'assets/demo.mp4',
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.gif',
    'assets/8.png',
    'assets/9.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
    'assets/13.png',
  ];

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  initializeVideo() {
    videoPlayerController = VideoPlayerController.asset('assets/demo.mp4');
    videoPlayerController.initialize();
    videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isMobile ? 0 : MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.symmetric(horizontal: 150, vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          index != 0
              ? InkWell(
                  child: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    setState(() {
                      if (index > 0) index--;
                    });
                  },
                )
              : SizedBox(width: 20),
          SizedBox(width: 20),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    width: 12,
                  )),
              child: index == 0
                  ? VideoPlayer(videoPlayerController)
                  : Image.asset(assetsList[index]),
            ),
          ),
          SizedBox(width: 20),
          index != assetsList.length - 1
              ? InkWell(
                  child: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    setState(() {
                      if (index < assetsList.length - 1) index++;
                    });
                  },
                )
              : SizedBox(width: 20),
        ],
      ),
    );
  }
}

class AppDescription extends StatelessWidget {
  const AppDescription({
    Key key,
    this.title,
    this.plugins,
    this.details,
    this.isMobile,
    this.tagLine,
    this.appScreen,
  }) : super(key: key);

  final String title;
  final String tagLine;
  final List<String> plugins;
  final List<String> details;
  final bool isMobile;
  final Widget appScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / (isMobile ? 1 : 2),
      padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
                ),
                Text(
                  tagLine,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App Description',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(
                    details.length,
                    (index) => Text(
                          details[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
              ),
            ],
          ),
          plugins != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plugins',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List<Widget>.generate(
                          plugins.length,
                          (index) => Text(
                                plugins[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                    )
                  ],
                )
              : SizedBox(),
          isMobile
              ? Center(
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.greenAccent,
                    child: Text(
                      'View App',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => appScreen));
                    },
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class BlackText extends StatelessWidget {
  BlackText(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
