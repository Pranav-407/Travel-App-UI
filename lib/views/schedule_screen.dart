import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app/views/home_screen.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  String _formatHeaderDate() {
    return '${_selectedDay.day} ${DateFormat('MMMM').format(_selectedDay)}';
  }

  List mySchedule = [
    {
      'image': 'assets/images/card1.jpeg',
      'title': 'Niladri Reservoir',
      'location': 'Tekergat, Sunamgnj',
      'date': DateTime.now()
    },
    {
      'image': 'assets/images/detail5.jpeg',
      'title': 'High Rech Park',
      'location': 'Zeero Point, Sylhet',
      'date': DateTime.now()
    },
    {
      'image': 'assets/images/card2.jpeg',
      'title': 'Darma Reservoir',
      'location': 'Darma, Kuningan',
      'date': DateTime.now()
    },
  ];

  List getScheduleForSelectedDay() {
    return mySchedule.where((schedule) {
      DateTime scheduleDate = schedule['date'] as DateTime;
      return isSameDay(scheduleDate, _selectedDay);
    }).toList();
  }

  Widget _buildScheduleContent() {
    final scheduleForDay = getScheduleForSelectedDay();
    
    if (scheduleForDay.isEmpty) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.event_busy,
                size: 64,
                color: Colors.grey[400],
              ),
              SizedBox(height: 16),
              Text(
                'No schedule for this date',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: scheduleForDay.length,
          itemBuilder: (context, index) {
            final schedule = scheduleForDay[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            schedule['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/calendar.svg'),
                                SizedBox(width: 6),
                                Text(
                                  DateFormat('dd MMMM yyyy').format(_selectedDay),
                                  style: GoogleFonts.poppins(
                                    color: Color.fromRGBO(125, 132, 141, 1),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Expanded(
                            child: Text(
                              schedule['title'],
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/location.svg'),
                                const SizedBox(width: 4),
                                Text(
                                  schedule['location'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(125, 132, 141, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset("assets/svg/forward.svg"),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 249, 1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 160, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Schedule',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  NotificationBadge()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatHeaderDate(),
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(
                              _focusedDay.year,
                              _focusedDay.month,
                              _focusedDay.day - 7,
                            );
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(
                              _focusedDay.year,
                              _focusedDay.month,
                              _focusedDay.day + 7,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2024, 1, 1),
                  lastDay: DateTime.utc(2025, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: CalendarFormat.week,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  headerVisible: false,
                  daysOfWeekHeight: 30,
                  rowHeight: 60,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(125, 132, 141, 1),
                    ),
                    weekendStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(125, 132, 141, 1),
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    selectedTextStyle: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    defaultTextStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    todayDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    weekendDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    outsideTextStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                    ),
                    cellMargin: EdgeInsets.all(4),
                    cellPadding: EdgeInsets.zero,
                    cellAlignment: Alignment.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            MySchedule(),
            SizedBox(height: 16),
            _buildScheduleContent(),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}



class MySchedule extends StatelessWidget {
  
  const MySchedule({
    super.key, 
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Schedule',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(27, 30, 40, 1),
            ),
          ),
          Text(
            'View All',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(13, 110, 253, 1),
            ),
          ),
        ],
      ),
    );
  }
}