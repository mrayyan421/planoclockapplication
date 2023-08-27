import 'package:flutter/material.dart';
import 'package:planoclock/brain.dart';
import 'Constants.dart';
import 'screen1.dart';
import 'package:intl/intl.dart';

class S2 extends StatefulWidget {
  final String title;
  final String priority;
  final String value;
  final String progress;
  final String details;
  final DateTime sd;
  final DateTime dd;
  final TimeOfDay dueTime;

  S2(
      {required this.title,
      required this.priority,
      required this.value,
      required this.progress,
      required this.details,
      required this.sd,
      required this.dd,
      required this.dueTime});

  @override
  State<S2> createState() => _S2State();
}

class _S2State extends State<S2> {
  int _selectedIndex = 0;
  TimeOfDay selectedNewDueTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PlanOClock',
          style: TextStyle(
            fontFamily: 'fonts/Pacifico-Regular.ttf',
            color: Colors.cyan,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: kscreen0bgColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                width: kcontainerSize,
                height: kcontainerSize,
                color: kcontainerColor,
                // color: kscreen0bgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        height: 450,
                        width: kcontainerSize,
                        decoration: kS0Boxdecoration().copyWith(
                          color: kscreen0bgColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              // kS2ContainerDisplay(),
                              widget.title,
                              textAlign: TextAlign.center,
                              style:
                                  klLabelTextStyle().copyWith(fontSize: 50.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: ks2Containerheight,
                                  width: ks2Containerwidth,
                                  decoration: ks2SmallContainerDecoration(),
                                  child: Center(
                                    child: Text(
                                      widget.priority,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: ks2Containerheight,
                                  width: ks2Containerwidth,
                                  decoration:
                                      ks2SmallContainerDecoration().copyWith(
                                    color: Color(0xFFbae6fe),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.value,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: ks2Containerheight,
                                  width: ks2Containerwidth,
                                  decoration:
                                      ks2SmallContainerDecoration().copyWith(
                                    color: Color(0XFF82fb8e),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.progress,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(widget.details,
                                textAlign: TextAlign.center,
                                style: klLabelTextStyle().copyWith()),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: kblockPadding, right: kblockPadding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Due Date',
                                    style: klLabelTextStyle().copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Due Time',
                                    style: klLabelTextStyle().copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: kblockPadding, right: kblockPadding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: kselectionBarColor,
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () async {
                                          DateTime selectedDueDate = widget.dd;
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: selectedDueDate,
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101),
                                          );
                                          if (pickedDate != null) {
                                            setState(() {
                                              selectedDueDate = pickedDate;
                                            });
                                          }
                                        },
                                        child: TextField(
                                          controller: TextEditingController(
                                            text: DateFormat('yyyy-MM-dd')
                                                .format(widget.dd),
                                          ),
                                          textAlign: TextAlign.center,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: kselectionBarColor,
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () async {
                                          TimeOfDay selectedDueTime =
                                              widget.dueTime;
                                          TimeOfDay? pickedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: selectedDueTime,
                                          );
                                          if (pickedTime != null) {
                                            setState(() {
                                              selectedNewDueTime =
                                                  pickedTime; // Convert TimeOfDay to DateTime
                                            });
                                          }
                                        },
                                        child: Text(
                                          formatTimeOfDay(
                                              selectedNewDueTime), // Display the formatted time
                                          textAlign: TextAlign.center,
                                          style: klLabelTextStyle(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: kS3MinusButton,
                              child: Icon(
                                Icons.remove_circle,
                                size: 50,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              unselectedIconTheme: IconThemeData(
                color: Color(0xFFc02e8c),
              ),
              backgroundColor: Color(0xFFff63d2),
              selectedIconTheme: IconThemeData(color: kiconColor),
              unselectedLabelStyle: TextStyle(color: Colors.black45),
              selectedLabelStyle: TextStyle(color: Colors.black45),
              items: [
                BottomNavigationBarItem(
                  icon: GestureDetector(
                      child: Icon(
                        Icons.home,
                        size: 35,
                        color: Colors.black45,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: kiconColor,
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      child: Center(
                        child: Icon(
                          Icons.edit,
                          color: Colors.black54,
                          size: 45,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  label: '', // This is the label text for the navigation item
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    child: Icon(
                      Icons.calendar_today,
                      size: 35,
                      color: Colors.black45,
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                    },
                  ),
                  label: 'Calendar',
                ),
              ],
              selectedItemColor: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
