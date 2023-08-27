import 'package:flutter/material.dart';
import 'screen2.dart';
import 'package:intl/intl.dart';

TextStyle ksLabelTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xFF9596af),
    fontSize: 20.0,
  );
}

Color kscreen0bgColor = Color(0xFFd20f8d);
TextEditingController timeinput = TextEditingController();
DateTime selectedValue = DateTime.now();
TextEditingController timeinputStart = TextEditingController();
TextEditingController dateinputStart = TextEditingController();
TextEditingController timeinputEnd = TextEditingController();
TextEditingController dateinputEnd = TextEditingController();
DateTime selectedStartDate = DateTime.now();
DateTime selectedEndDate = DateTime.now();
TextEditingController timeInputS = TextEditingController();
Color kcontainerColor = Color(0xFFe160b3);
TextStyle klLabelTextStyle() {
  return TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.black54);
}

TextStyle ks0LabelTextStyle() {
  return TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w500, color: Color(0xFFc02e8c));
}

double kcontainerSize = 350;
List<String> todosTitles = ['Do Laundry', 'Make Dinner', 'Visit Hospital OPD'];
var titleName = ''; //STring type variable for todoTitles
List<String> todoDetails = [
  'Wash clothes and dry them in the balcony',
  'Get all the required ingredients/cooking utensils and start cooking',
  'Get an appointment with Dr and visit the hospital'
];
String description =
    'Wash clothes and dry them in the balcony'; //String type variable for todoDetails
List<String> type = ['Random teams', 'solo', 'customized team'];
String ktitleType = '';
List<DateTime> kDdateArray = [
  DateTime(2023, 09, 14),
  DateTime(2023, 09, 18),
  DateTime(2021, 08, 23)
];
List<DateTime> kSdateArray = [
  DateTime(2023, 10, 10),
  DateTime(2023, 10, 15),
  DateTime(2021, 09, 23)
];
List<String> kDtimeArray = ['8:37 AM', '9:57 AM', '4:28 PM'];
DateTime startDate = DateTime.now();
// DateTime(2023, 09, 18);
DateTime endDate = DateTime.now();
// DateTime(2023, 09, 19);
String startTime = '8:37 AM';
// TimeOfDay(hour: 8, minute: 37);
TimeOfDay selectedEndTime = TimeOfDay.now();
String endTime = '9:50';
// TimeOfDay(hour: 1, minute: 45);
TimeOfDay selectedStartTime = TimeOfDay.now();
var navBarTouch = '';
const double h = 100;
double kblockPadding = 20;
Color kiconColor = Color(0xFFb33a6b);
double p = 4.0;
double r = 25.0;
double radius = 2;
String kvalue = 'moderate';
List<String> items = ['high', 'low', 'moderate'];
// String kitems = '';
TextStyle kSelectionBar() {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
}

Color kS3MinusButton = Color(0xFFea4ac3);
Color lightpink = Color(0xFFedaed7);
Color kselectionBarColor = Color(0xFFf3c4e2);
BoxDecoration kS0Boxdecoration() {
  return BoxDecoration(
    boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 10.0,
        spreadRadius: 2.0,
        offset: Offset(2.0, 2.0),
      ),
    ],
    color: lightpink,
    borderRadius: BorderRadius.circular(10.0),
  );
}

double ks2Containerwidth = 80;
double ks2Containerheight = 30;

BoxDecoration ks2SmallContainerDecoration() {
  return BoxDecoration(
      color: Color(0xFFf68787),
      borderRadius: BorderRadius.circular(r),
      boxShadow: const [
        BoxShadow(
            color: Colors.blueGrey,
            spreadRadius: 0.5,
            offset: Offset(2.0, 2.0),
            blurRadius: 8.0)
      ]);
}

double kS2SizedboxWidth = 40;
TextStyle kVerticalContainerTextStyle() {
  return TextStyle(
    color: Color(0xFFc02e8c),
    fontSize: 15.0,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
  );
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  final formattedTime =
      DateFormat.jm().format(dateTime); // Format time as per locale
  return formattedTime;
}

TimeOfDay selectedNewDueTime = TimeOfDay.now();
List<String> kTaskStatus = ['Complete', 'In progress', 'Postponed'];
String kProgress = 'In Progress';
bool kshowCompletedOnly = false;
String kComplete = 'Complete';
String kPostponed = 'Postponed';
String kInProgress = 'In Progress';
List<String> kCompleteList = ['Make Dinner'];
List<String> kInProgressList = ['Do Laundry', 'Visit Hospital OPD'];
Expanded kVerticalDisplay(BuildContext context) {
  return Expanded(
    child: SingleChildScrollView(
      padding: EdgeInsets.all(kblockPadding),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (String todo in todosTitles)
            // for (String priority in kTaskStatus)
            Padding(
              padding: EdgeInsets.symmetric(vertical: kblockPadding),
              child: Container(
                width: 50,
                height: 70,
                decoration: kS0Boxdecoration().copyWith(color: Colors.white70),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => S2(
                          title: todo,
                          priority: kvalue,
                          value: ktitleType,
                          progress: '',
                          details: description,
                          sd: startDate,
                          dd: endDate,
                          dueTime: selectedNewDueTime,
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      todo,
                      style: kVerticalContainerTextStyle(),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}

class kPriorityText extends StatelessWidget {
  const kPriorityText({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return Text(
      (todosTitles[i] == todosTitles[0])
          ? items[0]
          : (todosTitles[i] == todosTitles[1])
              ? items[1]
              : (todosTitles[i] == todosTitles[2])
                  ? items[2]
                  : kvalue,
      style: ksLabelTextStyle().copyWith(
          color: Color(0xFFf3c4e2),
          fontSize: 15.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w700),
    );
  }
}

// String kS2PriorityText() {
//   return (todosTitles[i] == todosTitles[0])
//       ? items[0]
//       : (todosTitles[i] == todosTitles[1])
//           ? items[1]
//           : (todosTitles[i] == todosTitles[2])
//               ? items[2]
//               : kvalue;
// }

Expanded kVerticalDisplayAllTask(BuildContext context) {
  return Expanded(
    child: SingleChildScrollView(
      padding: EdgeInsets.all(kblockPadding),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (String todo in todosTitles)
            Padding(
              padding: EdgeInsets.symmetric(vertical: kblockPadding),
              child: Container(
                width: 50,
                height: 70,
                decoration: kS0Boxdecoration().copyWith(color: Colors.white70),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => S2(
                          title: titleName,
                          priority: kvalue,
                          value: ktitleType,
                          progress: '',
                          details: description,
                          sd: startDate,
                          dd: endDate,
                          dueTime: selectedNewDueTime,
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      todo,
                      style: kVerticalContainerTextStyle(),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}

Expanded kVerticalDisplayComplete(BuildContext context) {
  if (kshowCompletedOnly) {
    kCompleteList =
        todosTitles.where((todo) => kCompleteList.contains(todo)).toList();
  } else {
    kCompleteList = todosTitles;
  }
  ;
  for (int i = 0; i < todosTitles.length; i++) {
    if (kTaskStatus[i] == kComplete) {
      kCompleteList.add(todosTitles[i]);
    }
  }
  return Expanded(
    child: SingleChildScrollView(
      padding: EdgeInsets.all(kblockPadding),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (String todo in kCompleteList)
            Padding(
              padding: EdgeInsets.symmetric(vertical: kblockPadding),
              child: Container(
                width: 50,
                height: 70,
                decoration: kS0Boxdecoration().copyWith(color: Colors.white70),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => S2(
                          title: kComplete,
                          priority: kvalue,
                          value: ktitleType,
                          progress: '',
                          details: description,
                          sd: startDate,
                          dd: endDate,
                          dueTime: selectedNewDueTime,
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      todosTitles[1],
                      style: kVerticalContainerTextStyle(),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}

TimeOfDay parseTimeOfDay(String timeString) {
  final List<String> timeParts = timeString.split(':');
  final int hours = int.parse(timeParts[0]);
  final int minutes = int.parse(timeParts[1]);
  return TimeOfDay(hour: hours, minute: minutes);
}
