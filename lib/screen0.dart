import 'package:flutter/material.dart';
import 'package:planoclock/Constants.dart';
import 'package:planoclock/screen2.dart';
import 'screen1.dart';
import 'package:intl/intl.dart';
import 'brain.dart';

class S1 extends StatefulWidget {
  const S1({Key? key}) : super(key: key);

  @override
  State<S1> createState() => _S1State();
}

class _S1State extends State<S1> {
  final DateFormat _dateFormat = DateFormat('dd/MM/yy');
  Future<void> _selectDate(BuildContext context,
      TextEditingController controller, DateTime selectedDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        controller.text = _dateFormat.format(selectedStartDate);
      });
    }
  }

  int _currentIndex = 0;
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
        color: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 290,
              decoration: BoxDecoration(
                color: Color(0xFFe160b3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(p),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Welcome back...',
                          style: ks0LabelTextStyle(),
                        ),
                        SizedBox(width: 60),
                        Padding(
                          padding: EdgeInsets.only(top: p),
                          child: GestureDetector(
                            child: Icon(
                              Icons.alarm,
                              color: kiconColor,
                              size: 40,
                            ),
                            onTap: () {
                              setState(() {
                                kiconColor = Color(0xFFffbee8);
                              });
                            },
                            onTapCancel: () {
                              setState(() {
                                kiconColor = Color(0xFFb33a6b);
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Ready for more?!?!?',
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w900,
                        fontSize: 36.0),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: kblockPadding),
                    child: Row(
                      children: <Widget>[
                        for (int i = 0; i < todosTitles.length; i++)
                          Padding(
                            padding: EdgeInsets.only(
                                right: kblockPadding, top: kblockPadding),
                            child: GestureDetector(
                              onTap: () {
                                print("Navigating with index $i");
                                print("todosTitles: $todosTitles");
                                print("items: $items");
                                print(items.length);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => S2(
                                      title: todosTitles[i],
                                      priority: kStorePriority(i),
                                      value: kStoreType(i),
                                      progress: kDisplayStatus(i),
                                      details: kDisplayDetails(i),
                                      sd: kSdateArray[i],
                                      dd: kDdateArray[i],
                                      dueTime: selectedNewDueTime,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: kS0Boxdecoration(),
                                height: 160,
                                width: 280,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    SizedBox(height: p),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFcd79af),
                                              borderRadius:
                                                  BorderRadius.circular(13.0),
                                            ),
                                            height: 40,
                                            width: 90,
                                            child: Center(
                                              child: kPriorityText(i: i),
                                            ),
                                          ),
                                          SizedBox(
                                            width: kS2SizedboxWidth,
                                          ),
                                          Text(
                                            kDisplayStatus(i),
                                            style: ksLabelTextStyle(),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      todosTitles[i],
                                      textAlign: TextAlign.center,
                                      style: klLabelTextStyle().copyWith(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      kDisplayDetails(i),
                                      textAlign: TextAlign.center,
                                      style: ks0LabelTextStyle()
                                          .copyWith(fontSize: 12),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          GestureDetector(
                                            child: Text(
                                              'Delete',
                                              style: ksLabelTextStyle()
                                                  .copyWith(color: Colors.red),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                todosTitles.removeAt(i);
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: kS2SizedboxWidth,
                                          ),
                                          GestureDetector(
                                            child: Text(
                                              'Edit',
                                              style: ksLabelTextStyle()
                                                  .copyWith(
                                                      color: Colors.green),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Home(),
                                                ),
                                              );
                                            },
                                          )
                                        ])
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kscreen0bgColor,
              height: 55.0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'All Task',
                        style:
                            kSelectionBar().copyWith(color: kselectionBarColor),
                      ),
                      onTap: () {
                        setState(() {
                          Color(0xffffffff);
                          kVerticalDisplayAllTask(context);
                        });
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        'Complete',
                        style:
                            kSelectionBar().copyWith(color: kselectionBarColor),
                      ),
                      onTap: () {
                        setState(() {
                          Color(0xFFffffff);
                          // kVerticalDisplayComplete(context);
                          kshowCompletedOnly = !kshowCompletedOnly;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        'Postponed',
                        style:
                            kSelectionBar().copyWith(color: kselectionBarColor),
                      ),
                      onLongPress: () {
                        setState(() {
                          Color(0xFFffffff);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            kVerticalDisplayAllTask(context),
            BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
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
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const S1(),
                          ),
                        );
                      });
                    },
                  ),
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
