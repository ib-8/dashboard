import 'package:flutter/material.dart';

class Palindrome extends StatefulWidget {
  @override
  _PalindromeState createState() => _PalindromeState();
}

class _PalindromeState extends State<Palindrome> {
  String inputString = '';
  String result = '';
  List<String> possibleStrings = [];
  TextEditingController textEditingController = TextEditingController();
  bool isChecked = false;

  bool checkPalindrome(String name, [bool isPossibityCheck = false]) {
    bool isEven = name.length % 2 == 0;
    bool isPalindrome;
    double length = (name.length / 2);
    String firstHalf = name
        .substring(0, isEven ? length.toInt() : length.floor())
        .toLowerCase();
    String secondHalf = name
        .substring(isEven ? length.toInt() : length.ceil(), name.length)
        .toLowerCase();

    String reversed = secondHalf.split('').reversed.join();

    isPalindrome = firstHalf == reversed;

    if (!isPossibityCheck) {
      setState(() {
        result = firstHalf == reversed ? 'Palindrome' : 'Not Palindrome';
        isChecked = true;
      });
    }

    if (!isPalindrome && !isPossibityCheck) {
      checkPossibility(firstHalf, reversed, name, length);
    }

    return isPalindrome;
  }

  checkPossibility(firstHalf, reversed, name, length) {
    List<String> matches = [];
    List<String> removals = [];
    if (firstHalf != reversed) {
      for (int i = 0; i < length.toInt(); i++) {
        if (firstHalf.contains(reversed.substring(i, i + 1))) {
          matches.add(reversed.substring(i, i + 1));
        } else {
          removals.add(reversed.substring(i, i + 1));
        }
        if (reversed.contains(firstHalf.substring(i, i + 1))) {
          matches.add(firstHalf.substring(i, i + 1));
        } else {
          removals.add(firstHalf.substring(i, i + 1));
        }
      }

      for (int i = 0; i < removals.length; i++) {
        String possible;
        List afterRemoved = name.split('');
        afterRemoved.remove(removals[i]);
        possible = afterRemoved.join();

        if (checkPalindrome(possible, true) &&
            possible.length > 2 &&
            !possibleStrings.contains(possible)) {
          possibleStrings.add(possible);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Palindrome')),
      body: Column(
        children: [
          SizedBox(height: 10),
          Visibility(
              visible: isChecked,
              replacement: SizedBox(
                height: 130,
              ),
              child: Container(
                height: 130,
                child: Text(
                  '$inputString\nis\n$result',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                onTap: () {
                  setState(() {
                    result = '';
                    possibleStrings.clear();
                  });
                },
                onChanged: (input) {
                  setState(() {
                    inputString = input.toLowerCase();
                    isChecked = false;
                    possibleStrings.clear();
                  });
                },
              ),
            ),
          ),
          AbsorbPointer(
            absorbing: inputString.length < 1,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              color: Colors.greenAccent,
              child: Text(
                'Check',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                checkPalindrome(inputString);
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            isChecked && possibleStrings.length > 0
                ? possibleStrings.length > 0
                    ? '${possibleStrings.length} Possibilities'
                    : 'No Possibilities'
                : '',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          isChecked
              ? Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: ListView.builder(
                      itemCount: possibleStrings.length,
                      itemBuilder: (_, index) {
                        return Center(
                            child: Text(
                          possibleStrings[index],
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ));
                      },
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
