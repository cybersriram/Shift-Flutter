import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Frontend extends StatefulWidget {
  const Frontend({Key? key}) : super(key: key);

  @override
  _FrontendState createState() => _FrontendState();
}

class _FrontendState extends State<Frontend> {
  String selected_date = "";
  String selectedshift = '';
  String day = DateFormat("EEEE").format(DateTime.now());
  List order = [];
  String Final_Shift = "";
  String currentdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(
                      color: Colors.red,
                      width: 4,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedshift = "Morning Shift";
                        order = ["Morning Shift","MidNight Shift","Afternoon Shift"];
                      });
                    },
                    child: Center(
                      child: Text(
                        "Morning Shift",
                        style: TextStyle(
                          fontSize: 27.0,
                          fontFamily: "Oswald",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(
                      color: Colors.red,
                      width: 4,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedshift = "Afternoon Shift";
                        order = ["Afternoon Shift","Morning Shift","MidNight Shift"];
                      });
                    },
                    child: Center(
                      child: Text(
                        "Afternoon Shift",
                        style: TextStyle(
                          fontSize: 27.0,
                          fontFamily: "Oswald",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(
                      color: Colors.red,
                      width: 4,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedshift = "MidNight Shift";
                        order = ["MidNight Shift","Afternoon Shift","Morning Shift"];
                      });
                    },
                    child: Center(
                      child: Text(
                        "MidNight Shift",
                        style: TextStyle(
                          fontSize: 27.0,
                          fontFamily: "Oswald",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Selected Shift: " + selectedshift,
                    style: TextStyle(fontSize: 26.0, fontFamily: "Oswald",color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              date();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent, //background color of button
                side: BorderSide(
                    width: 5, color: Colors.black), //border width and color
                elevation: 3, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(20) //content padding inside button
                ),
            child: Text("Select the Required Date",style:TextStyle(fontFamily: "Oswald",fontSize: 20.0))),
        Text(
          "Selected Date: " + selected_date,
          style: TextStyle(fontSize: 25.0, fontFamily: "Oswald",color:Colors.white),
        ),
        Container(
          margin: EdgeInsets.all(20.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
              color: Colors.red,
              width: 0,
            ),
          ),
          child: Center(
            child: Text(
              Final_Shift,
              style: TextStyle(
                fontFamily: "Oswald",
                fontSize: 27.0,
              ),
            ),
          ),
        )
      ],
    );
  }

  String monday() {
    String today = "";
    if (day == 'Monday') {
      today = currentdate;
    } else if (day == 'Tuesday') {
      today = DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(const Duration(days: 1)));
    } else if (day == 'Wednesday') {
      today = DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(const Duration(days: 2)));
    } else if (day == 'Thursday') {
      today = DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(const Duration(days: 3)));
    } else if (day == 'Friday') {
      today = DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(const Duration(days: 4)));
    } else if (day == 'Saturday') {
      today = DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(const Duration(days: 5)));
    } else if (day == 'Sunday') {
      today = DateFormat('yyyy-MM-dd')
          .format(DateTime.now().add(const Duration(days: 1)));
    }
    return today;
  }

  Future date() async {
    final date1 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    setState(() {
      String temp = (date1.toString()).split(" ")[0];
      selected_date = temp;
      DateTime a = DateTime.parse(monday());
      int difference = DateTime.parse(selected_date).difference(a).inDays;
      int q = (difference ~/ 7);
      int rem = q % 3;
      Final_Shift = order[rem];
    });
  }
}
