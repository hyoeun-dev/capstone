import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/utils/date_difference.dart';
import 'package:capstone/utils/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:intl/intl.dart';

class TodoContentsTextField extends StatefulWidget {
  final DateTime plannedDateTime;
  final bool isBottomPaddingRequired;

  const TodoContentsTextField({
    super.key,
    required this.plannedDateTime,
    required this.isBottomPaddingRequired
  });

  @override
  State<TodoContentsTextField> createState() => _TodoContentsTextFieldState();
}

class _TodoContentsTextFieldState extends State<TodoContentsTextField> {
  bool isChecked = false;

  DateTime? endDate;
  late TapGestureRecognizer endDateTapRecognizer;
  DateFormat dateFormat = DateFormat('MM/dd(E)', 'ko_KR');
  bool isSelected = false;

  void selectDate() {
    picker.DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2000, 1, 1),
      maxTime: DateTime(2050, 12, 31),
      currentTime: endDate,
      locale: picker.LocaleType.ko,
      onConfirm: (date) {
        setState(() {
          endDate = date;
          isSelected = true;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    endDateTapRecognizer = TapGestureRecognizer()..onTap = () => selectDate();
  }

  @override
  Widget build(BuildContext context) {
    return Padding( // Use Padding here for overall spacing
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: widget.isBottomPaddingRequired ? kDefaultPadding : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Align items centrally
        children: [
          SizedBox(
            width: 24, // Standard checkbox size
            height: 24,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), // Soften corners
              side: BorderSide(width: 1.5, color: blackColor.withAlpha(179)),
              checkColor: whiteColor,
              activeColor: blackColor,
            ),
          ),
          SizedBox(width: kDefaultPadding), // Spacing between checkbox and text
          Expanded( // Let content take available space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded( // Allow CupertinoTextField to expand
                      child: Container(
                        height: 35, // Give it a fixed height for consistency
                        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: mediumGreyColor)), // Bottom border
                        ),
                        child: CupertinoTextField.borderless(
                          padding: EdgeInsets.zero,
                          style: Theme.of(context).textTheme.bodyLarge,
                          placeholder: '할 일을 입력하세요',
                          placeholderStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: blackColor.withAlpha(128)),
                        ),
                      ),
                    ),
                    SizedBox(width: kDefaultPadding), // Spacing between text field and D-day
                    Text('D${(endDate != null) ? dateDifference(to: endDate!) : '-??'}', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                SizedBox(height: 4), // Small spacing between title and dates
                RichText(text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(text: '수행일 '),
                    TextSpan(text: getShortDate(widget.plannedDateTime.month,widget.plannedDateTime.day)),
                    TextSpan(text: ' | 마감일 '),
                    TextSpan(
                        text: (endDate == null) ? '선택' : dateFormat.format(endDate!),
                        style: TextStyle(color: (isSelected == false) ? blackColor.withAlpha(128) : blackColor),
                        recognizer: endDateTapRecognizer
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    endDateTapRecognizer.dispose();
    super.dispose();
  }
}

