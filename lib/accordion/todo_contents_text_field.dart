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
    return Column(
      children: [
        Container(
          margin: (widget.isBottomPaddingRequired) ? EdgeInsets.only(bottom: kDefaultPadding) : EdgeInsets.zero,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 20,
                  height: 30,
                  margin: EdgeInsets.only(left: kDefaultPadding),
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    side: BorderSide(width: 1.2),
                    checkColor: whiteColor,
                    activeColor: blackColor,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - kDefaultHorizontalPadding * 3 - 20,
                    height: 25,
                    margin: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CupertinoTextField.borderless(
                            padding: EdgeInsets.zero,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text('D${(endDate != null) ? dateDifference(to: endDate!) : '-??'}', style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - kDefaultHorizontalPadding * 3 - 20,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: '수행일 ', style: TextStyle(fontSize: 16, color: blackColor),),
                        TextSpan(
                          text: getShortDate(widget.plannedDateTime.month,widget.plannedDateTime.day), style: TextStyle(fontSize: 16, color: blackColor)),
                        TextSpan(
                          text: ' | 마감일 ', style: TextStyle(fontSize: 16, color: blackColor),),
                        TextSpan(
                            text: (endDate == null) ? '선택' : dateFormat.format(endDate!), style: TextStyle(fontSize: 16, color: (isSelected == false) ? blackColor.withAlpha(150) : blackColor), recognizer: endDateTapRecognizer),
                      ],
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    endDateTapRecognizer.dispose();
    super.dispose();
  }

}

