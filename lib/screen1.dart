import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:planoclock/brain.dart';
import 'Constants.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DateFormat _dateFormat = DateFormat('dd/MM/yy');

  @override
  void initState() {
    timeinput.text = "";
    super.initState();
  }

  Future<void> _selectDate(BuildContext context,
      TextEditingController controller, DateTime selectedDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedEndDate = picked;
        controller.text = _dateFormat.format(selectedStartDate);
      });
    }
  }

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(p),
              child: FloatingActionButton(
                backgroundColor: Color(0xFFb33a6b),
                child: Icon(Icons.add),
                onPressed: () {
                  // print('object');
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Are you sure you want to add the note?'),
                      content: IconButton(
                        icon: Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            addTitle();
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(p),
              child: Text(
                'Title',
                style: ksLabelTextStyle(),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: TextField(
                onChanged: (value) {
                  titleName = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter title here',
                ),
                style: klLabelTextStyle(),
              ),
            ),
            Container(
              // padding: EdgeInsets.all(p),
              child: Text(
                'Type',
                style: ksLabelTextStyle(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(p),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Solo/Customized or Random Teams',
                ),
                style: klLabelTextStyle(),
                onChanged: (value) {
                  ktitleType = value;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Start Date',
                  style: ksLabelTextStyle(),
                ),
                Text(
                  'Due Date',
                  style: ksLabelTextStyle(),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedStartDate,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != selectedStartDate) {
                        setState(() {
                          selectedStartDate = picked;
                        });
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.all(p), // Replace 'p' with actual padding
                      child: TextField(
                        controller: dateinputStart,
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today_outlined),
                          border: OutlineInputBorder(),
                          labelText: 'yyyy-MM-dd',
                        ),
                        style: klLabelTextStyle(),
                        onTap: () async {
                          DateTime? pickedDate2 = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate2 != null) {
                            print(pickedDate2);
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate2);
                            setState(() {
                              selectedStartDate = pickedDate2;
                              dateinputStart.text = formattedDate;
                              startDate = pickedDate2;
                            });
                          } else {
                            print('Date not selected');
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final DateTime? picked2 = await showDatePicker(
                          context: context,
                          initialDate: selectedEndDate,
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101));
                      if (picked2 != null && picked2 != selectedEndDate) {
                        setState(() {
                          selectedEndDate = picked2;
                        });
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.all(p), // Replace 'p' with actual padding
                      child: TextField(
                        controller: dateinputEnd,
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today_outlined),
                          border: OutlineInputBorder(),
                          labelText: 'yyyy-MM-dd',
                        ),
                        style: klLabelTextStyle(),
                        onTap: () async {
                          DateTime? pickedDate3 = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          DateTime? pickedDate6 = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate3 != null && pickedDate6 != null) {
                            print(pickedDate3);
                            print(pickedDate6);
                            String formattedDate1 =
                                DateFormat('yyyy-MM-dd').format(pickedDate3);
                            String formattedDate2 =
                                DateFormat('yyyy-MM-dd').format(pickedDate6);
                            setState(() {
                              selectedEndDate = pickedDate3;
                              selectedEndDate = pickedDate6;
                              kDdateArray.add(pickedDate3);
                              kSdateArray.add(pickedDate6);
                              dateinputStart.text = formattedDate2;
                              dateinputEnd.text = formattedDate1;
                              startDate = pickedDate6;
                              endDate = pickedDate3;
                            });
                          } else {
                            print('Date not selected');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Center(
                child: Text(
                  'Priority',
                  style: ksLabelTextStyle(),
                ),
              ),
            ),
            Center(
              child: DropdownButton(
                padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                value: kvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? value4) {
                  setState(() {
                    kvalue = value4!;
                  });
                },
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(8.0, p, 8.0, 0.0),
                    child: TextField(
                        onChanged: (value5) {
                          startTime = value5;
                        },
                        controller: timeinputStart,
                        decoration: InputDecoration(
                          icon: Icon(Icons.timer),
                          labelText: "Enter Start Time",
                        ),
                        // readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime1 = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if (pickedTime1 != null) {
                            String formattedTime = pickedTime1.format(context);
                            setState(() {
                              timeinputStart.text = formattedTime;
                            });
                          }
                        },
                        style: klLabelTextStyle()),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    child: TextField(
                      controller: timeinputEnd,
                      decoration: InputDecoration(
                        icon: Icon(Icons.timer),
                        labelText: "Enter End Time",
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime2 = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
                        if (pickedTime2 != null) {
                          String formattedTime = pickedTime2.format(context);
                          setState(() {
                            timeinputEnd.text = formattedTime;
                          });
                        }
                      },
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 0.0),
                child: TextField(
                    onChanged: (value6) {
                      description = value6;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                    maxLines: 5,
                    minLines: 1,
                    style: klLabelTextStyle()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
