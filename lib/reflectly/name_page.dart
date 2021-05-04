import 'package:flutter/material.dart';
import 'package:myflutterdashboard/reflectly/color_page.dart';

class NamePage extends StatefulWidget {
  NamePage({
    this.onPressed,
    this.onEditingStart,
    this.onEditingStopped,
    this.focusNode,
  });
  final Function onPressed;
  final Function onEditingStart;
  final Function onEditingStopped;
  final FocusNode focusNode;

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'So nice tomeet you! What do\n your friends call you?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 23,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            focusNode: widget.focusNode,
            controller: textController,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
            textCapitalization: TextCapitalization.sentences,
            textAlign: TextAlign.center,
            cursorColor: kPurple,
            maxLength: 20,
            decoration: InputDecoration(
              fillColor: Color(0x11000000),
              focusColor: Colors.white,
              hoverColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 30),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
              ),
              hintText: 'Your nickname...',
              hintStyle: TextStyle(
                color: Color(0xccffffff),
                fontSize: 22,
              ),
            ),
            onTap: widget.onEditingStart,
            onEditingComplete: widget.onEditingStopped,
          ),
        ),
        widget.focusNode.hasFocus
            ? SizedBox()
            : MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                color: Colors.white,
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                    color: kPurple,
                    fontSize: 18,
                  ),
                ),
                onPressed: widget.onPressed,
              ),
      ],
    );
  }
}
