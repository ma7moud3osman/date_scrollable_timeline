/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timetable/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final double? horizontalSpacer;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final BoxBorder? border;

  const DateWidget({
    super.key,
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.horizontalSpacer,
    this.onDateSelected,
    this.locale,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalSpacer ?? 0, vertical: 2),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        splashColor: Colors.transparent,
        onTap: () {
          // Check if onDateSelected is not null
          if (onDateSelected != null) {
            // Call the onDateSelected Function
            onDateSelected!(date);
          }
        },
        child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: Colors.white,
            border: border,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text(
              //     DateFormat("MMM", locale).format(date).toUpperCase(), // Month
              //     style: monthTextStyle),
              Text(
                DateFormat(locale == 'ar' ? "EEEE" : "E", locale)
                    .format(date)
                    .toUpperCase(), // WeekDay
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: dayTextStyle,
              ),
              Text(
                date.day.toString(), // Date
                style: dateTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
