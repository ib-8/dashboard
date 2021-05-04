import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  String word1 = '';
  String word2 = '';
  String word3 = '';
  String word4 = '';
  String word5 = '';
  String word6 = '';
  String word7 = '';
  String word8 = '';
  String word9 = '';
  String winner;
  int player;
  int player1Won = 0;
  int player2Won = 0;
  String playerName = 'Player 1';
  Color mainColor = Color(0xff536dfe);
  Color purple = Color(0xff536dfe);
  Color green = Color(0xff00bfa5);
  String result;
  bool showDialog = false;

  findPlayer(spot) {
    if (result == null) {
      setState(() {
        mainColor = player == 1 ? purple : green;
        player = player == 1 ? 2 : 1;
        playerName = player == 1 ? 'Player 2' : 'Player 1';
      });
      assignWord(spot);
    }
  }

  assignWord(int spot) {
    switch (spot) {
      case 1:
        if (word1 == '') {
          word1 = player == 1 ? 'X' : 'O';
        }
        break;
      case 2:
        if (word2 == '') {
          word2 = player == 1 ? 'X' : 'O';
        }
        break;
      case 3:
        if (word3 == '') {
          word3 = player == 1 ? 'X' : 'O';
        }
        break;
      case 4:
        if (word4 == '') {
          word4 = player == 1 ? 'X' : 'O';
        }
        break;
      case 5:
        if (word5 == '') {
          word5 = player == 1 ? 'X' : 'O';
        }
        break;
      case 6:
        if (word6 == '') {
          word6 = player == 1 ? 'X' : 'O';
        }
        break;
      case 7:
        if (word7 == '') {
          word7 = player == 1 ? 'X' : 'O';
        }
        break;
      case 8:
        if (word8 == '') {
          word8 = player == 1 ? 'X' : 'O';
        }
        break;
      case 9:
        if (word9 == '') {
          word9 = player == 1 ? 'X' : 'O';
        }
        break;
    }
    checkWinner();
    if (result == '' || result == null) {
      checkCompleted();
    }
  }

  checkWinner() {
    if (word1 != '' && word1 == word2 && word1 == word3) {
      return scoreCount();
    }
    if (word4 != '' && word4 == word5 && word4 == word6) {
      return scoreCount();
    }
    if (word7 != '' && word7 == word8 && word7 == word9) {
      return scoreCount();
    }
    if (word1 != '' && word1 == word4 && word1 == word7) {
      return scoreCount();
    }
    if (word2 != '' && word2 == word5 && word2 == word8) {
      return scoreCount();
    }
    if (word3 != '' && word3 == word6 && word3 == word9) {
      return scoreCount();
    }
    if (word1 != '' && word1 == word5 && word1 == word9) {
      return scoreCount();
    }
    if (word3 != '' && word3 == word5 && word3 == word7) {
      return scoreCount();
    }
  }

  checkCompleted() {
    if (word1 != '' &&
        word2 != '' &&
        word3 != '' &&
        word4 != '' &&
        word5 != '' &&
        word6 != '' &&
        word7 != '' &&
        word8 != '' &&
        word9 != '') {
      setState(() {
        result = 'Draw';
        showDialog = true;
      });
    }
  }

  scoreCount() {
    setState(() {
      if (player == 1) {
        player1Won++;
        result = 'Player 1 Won';
      } else if (player == 2) {
        player2Won++;
        result = 'Player 2 Won';
      }
      showDialog = true;
    });
    resultDialog();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  resultDialog() {
    // scaffoldKey.currentState.showBodyScrim(showDialog, 0.5);

    // return showDialog(
    //   context: context,
    //   child: SimpleDialog(
    //     contentPadding: EdgeInsets.zero,
    //     titlePadding: EdgeInsets.zero,
    //     children: <Widget>[
    //       Card(
    //         elevation: 0,
    //         shape:
    //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    //           child: Column(
    //             children: [
    //               Center(
    //                 child: Text(
    //                   result,
    //                   style: TextStyle(fontSize: 30),
    //                 ),
    //               ),
    //               SizedBox(height: 30),
    //               MaterialButton(
    //                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(20)),
    //                 child: Text(
    //                   'Play again',
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //                 color: Colors.blue,
    //                 onPressed: () => reset(1),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  reset(int a) {
    setState(() {
      showDialog = false;
      word1 = '';
      word2 = '';
      word3 = '';
      word4 = '';
      word5 = '';
      word6 = '';
      word7 = '';
      word8 = '';
      word9 = '';
      player = null;
      mainColor = purple;
      playerName = 'Player 1';
      result = null;
    });
    // scaffoldKey.currentState.showBodyScrim(showDialog, 0.0);

    // a == 1 ? Navigator.pop(context) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: scaffoldKey,
          backgroundColor: mainColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Player 1',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            player1Won.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.swap_horizontal_circle,
                        color: Colors.white,
                        size: 50,
                      ),
                      onTap: () => findPlayer(0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Player 2',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            player2Won.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  playerName,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => reset(0),
                  child: Text(
                    'Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: Holder(
                                      word: word1,
                                      top: 0,
                                      left: 0,
                                      topColor: Colors.white,
                                      leftColor: Colors.white,
                                      onpressed: () =>
                                          word1 == '' ? findPlayer(1) : null,
                                    ),
                                  ),
                                  Expanded(
                                    child: Holder(
                                      word: word2,
                                      top: 0,
                                      topColor: Colors.white,
                                      onpressed: () =>
                                          word2 == '' ? findPlayer(2) : null,
                                    ),
                                  ),
                                  Expanded(
                                    child: Holder(
                                      word: word3,
                                      top: 0,
                                      right: 0,
                                      topColor: Colors.white,
                                      rightColor: Colors.white,
                                      onpressed: () =>
                                          word3 == '' ? findPlayer(3) : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: Holder(
                                      word: word4,
                                      left: 0,
                                      leftColor: Colors.white,
                                      onpressed: () =>
                                          word4 == '' ? findPlayer(4) : null,
                                    ),
                                  ),
                                  Expanded(
                                    child: Holder(
                                      word: word5,
                                      onpressed: () =>
                                          word5 == '' ? findPlayer(5) : null,
                                    ),
                                  ),
                                  Expanded(
                                    child: Holder(
                                      word: word6,
                                      right: 0,
                                      rightColor: Colors.white,
                                      onpressed: () =>
                                          word6 == '' ? findPlayer(6) : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: Holder(
                                      word: word7,
                                      left: 0,
                                      bottom: 0,
                                      leftColor: Colors.white,
                                      bottomColor: Colors.white,
                                      onpressed: () =>
                                          word7 == '' ? findPlayer(7) : null,
                                    ),
                                  ),
                                  Expanded(
                                    child: Holder(
                                      word: word8,
                                      bottom: 0,
                                      bottomColor: Colors.white,
                                      onpressed: () =>
                                          word8 == '' ? findPlayer(8) : null,
                                    ),
                                  ),
                                  Expanded(
                                    child: Holder(
                                      word: word9,
                                      right: 0,
                                      bottom: 0,
                                      rightColor: Colors.white,
                                      bottomColor: Colors.white,
                                      onpressed: () =>
                                          word9 == '' ? findPlayer(9) : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        showDialog
            ? ModalBarrier(
                color: Color(0x88000000),
              )
            : SizedBox(),
        showDialog
            ? Column(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                result,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            SizedBox(height: 20),
                            MaterialButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Play again',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              color: mainColor,
                              onPressed: () => reset(1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}

class Holder extends StatelessWidget {
  Holder({
    this.word,
    this.bottom = 2,
    this.left = 2,
    this.right = 2,
    this.top = 2,
    this.topColor = Colors.black,
    this.bottomColor = Colors.black,
    this.rightColor = Colors.black,
    this.leftColor = Colors.black,
    this.onpressed,
  });

  final String word;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final Color topColor;
  final Color bottomColor;
  final Color rightColor;
  final Color leftColor;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: bottom, color: bottomColor),
          right: BorderSide(width: right, color: rightColor),
          top: BorderSide(width: top, color: topColor),
          left: BorderSide(width: left, color: leftColor),
        ),
      ),
      child: FlatButton(
        child: Center(
          child: Text(
            word,
            style: TextStyle(
              fontSize: 80,
              fontFamily: GoogleFonts.nanumPenScript().fontFamily,
            ),
          ),
        ),
        onPressed: onpressed,
      ),
    );
  }
}
